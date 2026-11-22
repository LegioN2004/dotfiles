#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clean LaTeX for Notion
# @raycast.mode compact
# @raycast.packageName Clipboard
# @raycast.icon 📐

# Optional parameters:
# @raycast.description Clean and format clipboard LaTeX & Markdown for seamless Notion pasting (supports local MLX/LLM)
# @raycast.author Milinda Barua

# Locate python3
if [ -x "/opt/homebrew/bin/python3" ]; then
    PYTHON_CMD="/opt/homebrew/bin/python3"
elif [ -x "/usr/local/bin/python3" ]; then
    PYTHON_CMD="/usr/local/bin/python3"
elif command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD="$(command -v python3)"
else
    echo "❌ Python 3 not found"
    exit 1
fi

exec "$PYTHON_CMD" - "$@" << 'EOF'
import sys
import os
import re
import subprocess
import urllib.request
import urllib.error
import json

def get_clipboard() -> str:
    # If text is piped in via stdin, use it (enables CLI testing and shell pipelines)
    try:
        if not sys.stdin.isatty():
            piped = sys.stdin.read()
            if piped.strip():
                return piped
    except Exception:
        pass
    try:
        p = subprocess.run(["pbpaste"], capture_output=True, text=True, check=True)
        return p.stdout
    except Exception:
        return ""

def set_clipboard(text: str) -> bool:
    try:
        subprocess.run(["pbcopy"], input=text, text=True, check=True)
        return True
    except Exception:
        return False

def is_math_content(s: str) -> bool:
    """Check if a string looks like math rather than currency or plain text."""
    s = s.strip()
    if not s:
        return False
    # If it is pure currency / numbers, skip
    if re.match(r"^\d+([.,]\d+)?$", s):
        return False
    # Math indicator symbols
    math_indicators = ["\\", "^", "_", "{", "}", "=", "<", ">", "+", "-", "*", "/", "pm", "int", "sum", "frac"]
    if any(ind in s for ind in math_indicators):
        return True
    if re.match(r"^[a-zA-Z\d\s()+\-*/=]+$", s) and any(c in s for c in "=+-*/"):
        return True
    return False

def check_syntax_corruption(text: str) -> list[str]:
    """Check for basic syntax corruption in LaTeX environments."""
    issues = []
    # Check environments
    begins = re.findall(r"\\begin\{([a-zA-Z*]+)\}", text)
    ends = re.findall(r"\\end\{([a-zA-Z*]+)\}", text)
    if begins != ends:
        issues.append("Mismatched \\begin and \\end environments")

    # Check \left and \right balance
    lefts = len(re.findall(r"\\left[\(\[\{\.\|]", text))
    rights = len(re.findall(r"\\right[\)\]\}\.\|]", text))
    if lefts != rights:
        issues.append("Unbalanced \\left and \\right delimiters")

    return issues

def call_local_llm(prompt_text: str) -> str | None:
    """Query local OpenAI-compatible endpoint (LM Studio on 1234, Ollama on 11434, MLX on 8080)."""
    endpoints = [
        "http://127.0.0.1:1234/v1/chat/completions",   # LM Studio default
        "http://127.0.0.1:11434/v1/chat/completions",  # Ollama default
        "http://127.0.0.1:8080/v1/chat/completions",   # llama.cpp / mlx-lm
    ]

    system_prompt = (
        "You are an expert LaTeX and Markdown repair tool. "
        "Fix broken LaTeX syntax, unclosed brackets, unbalanced \\left/\\right, missing delimiters, "
        "and format display math as '$$\\n...\\n$$' and inline math as '$...$' for Notion. "
        "Preserve all other text, markdown structure, and code blocks exactly. "
        "Do NOT output any thoughts, preamble, or markdown code fence around the response. "
        "Output ONLY the repaired markdown."
    )

    payload = {
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": prompt_text}
        ],
        "temperature": 0.1,
        "max_tokens": 4096
    }
    data = json.dumps(payload).encode("utf-8")

    for url in endpoints:
        try:
            req = urllib.request.Request(url, data=data, headers={"Content-Type": "application/json"}, method="POST")
            with urllib.request.urlopen(req, timeout=3.5) as response:
                if response.status == 200:
                    res = json.loads(response.read().decode("utf-8"))
                    choices = res.get("choices", [])
                    if choices:
                        content = choices[0].get("message", {}).get("content", "")
                        if content:
                            return content.strip()
        except Exception:
            continue
    return None

def clean_latex_markdown(text: str, force_ai: bool = False) -> tuple[str, str]:
    if not text.strip():
        return text, "⚠️ Clipboard is empty"

    # Step 1: Protect non-math code blocks from regex modifications
    code_blocks = []
    def save_code_block(m):
        lang = (m.group(1) or "").lower()
        content = m.group(2)
        # If it is an explicit latex/math block, convert directly to display math
        if lang in ["latex", "math", "katex"]:
            return f"\n\n$$\n{content.strip()}\n$$\n\n"
        idx = len(code_blocks)
        code_blocks.append(m.group(0))
        return f"%%RAYCAST_CODE_BLOCK_{idx}%%"

    processed = re.sub(r"```([a-zA-Z0-9_-]*)\n(.*?)```", save_code_block, text, flags=re.DOTALL)

    # Step 2: Convert \[ ... \] display math to Notion block math ($$\n...\n$$)
    def replace_display_bracket(m):
        content = m.group(1).strip()
        return f"\n\n$$\n{content}\n$$\n\n"

    processed = re.sub(r"\\\[\s*(.*?)\s*\\\]", replace_display_bracket, processed, flags=re.DOTALL)

    # Step 3: Ensure existing $$ ... $$ display blocks have clean line breaks around and inside
    def format_display_blocks(m):
        content = m.group(1).strip()
        return f"\n\n$$\n{content}\n$$\n\n"

    processed = re.sub(r"(?<!\$)\$\$\s*(.*?)\s*\$\$(?!\$)", format_display_blocks, processed, flags=re.DOTALL)

    # Step 4: Convert \( ... \) inline math to $...$ without internal whitespace
    def replace_inline_paren(m):
        content = m.group(1).strip()
        return f"${content}$"

    processed = re.sub(r"\\\(\s*(.*?)\s*\\\)", replace_inline_paren, processed, flags=re.DOTALL)

    # Step 5: Fix inner spaces inside $ ... $ only when it's genuinely math (avoids currency)
    def fix_inline_dollar(m):
        full = m.group(0)
        content = m.group(1)
        trimmed = content.strip()
        if is_math_content(trimmed):
            return f"${trimmed}$"
        return full

    processed = re.sub(r"(?<!\$)\$(?!\$)([^\$\n]+?)(?<!\$)\$(?!\$)", fix_inline_dollar, processed)

    # Step 6: Normalize common HTML entities
    html_entities = {
        "&nbsp;": " ",
        "&lt;": "<",
        "&gt;": ">",
        "&amp;": "&",
        "&times;": r"\times ",
        "&plusmn;": r"\pm ",
        "&le;": r"\le ",
        "&ge;": r"\ge ",
        "&ne;": r"\ne ",
    }
    for ent, rep in html_entities.items():
        processed = processed.replace(ent, rep)

    # Step 7: Restore protected code blocks
    for idx, cb in enumerate(code_blocks):
        processed = processed.replace(f"%%RAYCAST_CODE_BLOCK_{idx}%%", cb)

    # Step 8: Clean up excessive newlines
    processed = re.sub(r"\n{3,}", "\n\n", processed).strip()

    # Step 9: Check for corruption or force AI
    issues = check_syntax_corruption(processed)
    ai_used = False
    if force_ai or issues:
        ai_fixed = call_local_llm(processed)
        if ai_fixed:
            processed = ai_fixed
            ai_used = True

    # Count equations for stats in Raycast HUD
    num_blocks = len(re.findall(r"(?<!\$)\$\$\s*(.*?)\s*\$\$(?!\$)", processed, flags=re.DOTALL))
    num_inline = len(re.findall(r"(?<!\$)\$(?!\$)([^\$\n]+?)(?<!\$)\$(?!\$)", processed))

    summary_parts = []
    if num_blocks:
        summary_parts.append(f"{num_blocks} block")
    if num_inline:
        summary_parts.append(f"{num_inline} inline")

    stats = ", ".join(summary_parts) if summary_parts else "formatted"
    tag = " [AI Repaired]" if ai_used else ""
    return processed, f"✅ Notion LaTeX ({stats}){tag}"

def main():
    force_ai = "--ai" in sys.argv or "ai" in sys.argv

    # Allow CLI testing: ./raycast-clean-latex.sh --test "markdown"
    if "--test" in sys.argv:
        idx = sys.argv.index("--test")
        sample = sys.argv[idx + 1] if idx + 1 < len(sys.argv) else ""
        cleaned, msg = clean_latex_markdown(sample, force_ai=force_ai)
        print(f"Status: {msg}\n--- Result ---\n{cleaned}")
        return

    clipboard_text = get_clipboard()
    if not clipboard_text.strip():
        print("⚠️ Clipboard is empty")
        sys.exit(0)

    cleaned_text, status_msg = clean_latex_markdown(clipboard_text, force_ai=force_ai)
    if set_clipboard(cleaned_text):
        print(status_msg)
    else:
        print("❌ Failed to update clipboard")
        sys.exit(1)

if __name__ == "__main__":
    main()
EOF
