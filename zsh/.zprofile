if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"
