# 📋 System Tweaks, Custom Commands & Revert Guide

This document tracks system configurations, power management tweaks, window management fixes, and environment changes made to this macOS setup. For each change, the rationale, command ran, and exact steps to revert back to original system defaults are documented.

---

## 📑 Table of Contents
1. [🔋 Power Management & Overnight Battery (DarkWake)](#1--power-management--overnight-battery-darkwake)
2. [🪟 Yabai & SKHD Window Management](#2--yabai--skhd-window-management)
3. [🧵 Tmux Session Save & Restore (Resurrect / TPM)](#3--tmux-session-save--restore-resurrect--tpm)
4. [📦 Node, pnpm & Neovim LSP Environment](#4--node-pnpm--neovim-lsp-environment)
5. [⚡ Shell Startup Optimization (Zsh & Fish)](#5--shell-startup-optimization-zsh--fish)
6. [🌙 Raycast Sleep & Wake Automation](#6--raycast-sleep--wake-automation)

---

## 1. 🔋 Power Management & Overnight Battery (DarkWake)

### Problem
Overnight sleep logs showed **47 DarkWakes** between 11:00 PM and 7:00 AM (waking every 10–15 minutes). The Wi-Fi/Bluetooth hardware (`wifibt SMC.OutboxNotEmpty`) was repeatedly waking the CPU and radios while the lid was closed to maintain push notification sockets (`TCPKeepAlive=active`) and Power Nap background tasks, resulting in 5%–15%+ unexpected overnight battery drain.

### Applied Commands (Battery Mode Only)
```bash
# 1. Disable TCP keep-alive during sleep while on battery power
sudo pmset -b tcpkeepalive 0

# 2. Disable Power Nap while on battery power
sudo pmset -b powernap 0
```
*(macOS displays an informational warning that Find My Mac offline tracking and FaceTime rings will not occur while asleep on battery; when the lid is opened, network connections resume in <1s).*

### How to Check Current Status
```bash
pmset -g custom
pmset -g log | grep "DarkWake from" | tail -n 20
```

### How to Revert
To restore macOS default behavior (wake every 15 min for push notifications on battery):
```bash
sudo pmset -b tcpkeepalive 1
sudo pmset -b powernap 1
```
Or reset all power management settings to Apple factory defaults:
```bash
sudo pmset restoredefaults
```

---

## 2. 🪟 Yabai & SKHD Window Management

### Problems Solved
1. **Herdr Auto-Launch on `cmd + 1`**: `skhdrc` had an unconditional `osascript -e 'tell application "Herdr" to activate'` which launched Herdr on macOS whenever closed.
2. **Terminal Tab Split / Blank Space Bug**: Opening new tabs (`Cmd + T`) in `Terminal.app` on Space 1 split the window and left ghost blank halves due to BSP incompatibility with native macOS tab merging and `Stats.app` popups being tiled.
3. **Focus Lost to Brave Browser**: Switching from Brave (Space 2) to Space 1 failed to transfer macOS keyboard focus to terminal emulators.
4. **Window Float Toggle**: Added an ergonomic floating toggle shortcut using the `cmd` modifier.
5. **Finder Interfering on Other Workspaces**: Finder windows had no routing rule in `yabairc`, allowing windows to spawn on Space 2 or 3 and stay open when switching away from Space 4.
6. **Time Out Routing to Workspace 10**: Pinned `Time Out` permanently to Workspace 10 (`space=10`), with full keyboard navigation (`cmd - 0` to focus space 10, `cmd + shift - 0` to send window to space 10).
7. **IDE & Code Editor Routing to Workspace 3**: Unified and pinned all IDEs (VS Code, Antigravity, Zed, Cursor, Windsurf, Xcode, JetBrains suite, Sublime Text) to Workspace 3 (`space=3`).

### Changes Made
* **`skhd/.config/skhd/skhdrc`**:
  - Reverted `cmd - 1` to standard: `yabai -m space --focus 1`.
  - Added centered floating toggle:
    ```sh
    cmd + shift - space : yabai -m window --toggle float --grid 4:4:1:1:2:2
    ```
  - Added Workspace 10 focus and window transfer shortcuts:
    ```sh
    cmd - 0 : yabai -m space --focus 10
    cmd + shift - 0 : yabai -m window --space 10
    ```
* **`yabai/.config/yabai/yabairc`**:
  - Set Workspace 1 to `stack` layout (`yabai -m space 1 --layout stack`), matching Spaces 2–5. Prevents `Cmd + T` from triggering BSP screen splitting.
  - Added dedicated Finder rules pinning Finder windows strictly to Workspace 4, while keeping file operation dialogs floating:
    ```bash
    yabai -m rule --add app="^Finder$" title="(Co(py|mpleting)|Move|Progress|Info)" manage=off
    yabai -m rule --add app="^Finder$" subrole="^AXDialog$" manage=off
    yabai -m rule --add app="^Finder$" space=4
    ```
  - Routed `Time Out` to Space 10:
    ```bash
    yabai -m rule --add app="^Time Out$" space=10
    ```
  - Routed all IDEs and Code Editors to Workspace 3:
    ```bash
    yabai -m rule --add app="^[Aa]ntigravity.*$" space=3
    yabai -m rule --add app="^(Code|Visual Studio Code|Code - Insiders|VSCodium)$" space=3
    yabai -m rule --add app="^(Cursor|Windsurf|Trae|Positron)$" space=3
    yabai -m rule --add app="^Zed.*$" space=3
    yabai -m rule --add app="^Xcode$" space=3
    yabai -m rule --add app="^(IntelliJ IDEA.*|OpenIDEA|PyCharm.*|WebStorm|CLion|Rider|DataGrip|GoLand|PhpStorm|RubyMine|Android Studio|RustRover|Fleet)$" space=3
    yabai -m rule --add app="^(Sublime Text|Nova|Eclipse)$" space=3
    ```
  - Added `manage=off` rules for `Stats` and `universalAccessAuthWarn`.
  - Routed `space_changed` signal to `~/.config/yabai/focus_space.sh "$YABAI_SPACE_INDEX"`.
* **Dock Cleanup**: Cleared conflicting manual macOS space assignments (`defaults delete com.apple.spaces "app-bindings" && killall Dock`).
* **`yabai/.config/yabai/focus_space.sh`**:
  - Dedicated script that safely focuses the active window and makes its application frontmost via System Events *only if the application is currently running*.

### How to Restart Services
```bash
yabai --restart-service && skhd --restart-service
```
*(Note: If yabai is stopped, restart via `yabai --start-service` or `yabai --stop-service 2>/dev/null; yabai --start-service`).*

### How to Revert
1. In `skhd/.config/skhd/skhdrc`, comment out or remove line:
   ```sh
   # cmd + shift - space : yabai -m window --toggle float --grid 4:4:1:1:2:2
   ```
2. In `yabai/.config/yabai/yabairc`, change `yabai -m space 1 --layout stack` back to `bsp`.
3. Restart yabai and skhd: `yabai --restart-service && skhd --restart-service`.

---

## 3. 🧵 Tmux Session Save & Restore (Resurrect / TPM)

### Problem
Pressing Prefix (`Ctrl + t`) then `Ctrl + s` or `Ctrl + r` did nothing. Tmux Plugin Manager (`tpm`) was not cloned on the system, plugins (`tmux-resurrect`, `tmux-continuum`, `tmux-sensible`) were never installed, and `.tmux.conf` had a typo (`@ressurect-strategy-nvim`).

### Changes Made
1. Cloned TPM:
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ln -s ~/.tmux/plugins ~/.config/tmux/plugins
   ```
2. Installed plugins via TPM installer:
   ```bash
   ~/.tmux/plugins/tpm/bin/install_plugins
   ```
3. In `tmux/.tmux.conf`:
   - Corrected typo: `@resurrect-strategy-nvim 'session'`.
   - Updated TPM run path to standard `run '~/.tmux/plugins/tpm/tpm'`.
   - Sourced config: `tmux source-file ~/.tmux.conf`.

### Keybindings
* **Save session**: `Ctrl + t` then `Ctrl + s` (status bar displays `"Saving session..."`).
* **Restore session**: `Ctrl + t` then `Ctrl + r` (status bar displays `"Restoring session..."`).

### How to Revert
To remove TPM and all saved session data:
```bash
rm -rf ~/.tmux/plugins ~/.tmux/resurrect ~/.config/tmux/plugins
tmux kill-server
```

---

## 4. 📦 Node, pnpm & Neovim LSP Environment

### Problem
`zsh` and `fish` reported `pnpm: command not found` after system restarts, and Neovim language servers (`tailwindcss`, `ts_ls`, `emmet_language_server`) failed with exit code 127 (command not found).

### Changes Made
* **`zsh/.zshrc`**: Added persistent exports for `PNPM_HOME` and local binary directories:
  ```bash
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$HOME/.local/bin:$PATH"
  ```
* **`fish/.config/fish/config.fish`**: Added equivalent path entries to fish path array:
  ```fish
  set -gx PNPM_HOME "$HOME/.local/share/pnpm"
  fish_add_path $PNPM_HOME $HOME/.local/bin
  ```

### How to Revert
Remove the `PNPM_HOME` and path exports from `zsh/.zshrc` and `fish/.config/fish/config.fish`.

---

## 5. ⚡ Shell Startup Optimization (Zsh & Fish)

### Changes Made
* **Zsh**: Adopted pure DIY configuration (Option A) with zero third-party plugin managers (e.g. Oh-My-Zsh). Uses daily-cached `compinit`, lazy-loaded NVM (`nvm() { unset -f nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm "$@"; }`), and standalone Git aliases. Startup latency reduced to **~70–80ms**.
* **Fish**: Migrated traditional function wrappers to native Fish abbreviations (`abbr`) for zero runtime function overhead and instant expansion. Startup latency reduced to **~8–15ms**.
* **Ghostty**: Configured as the primary terminal emulator with native macOS tabbing, GPU rendering, and clean font typography.

### How to Test Startup Speed
```bash
# Fish (target: ~8-15ms)
time fish -i -c exit

# Zsh (target: ~70-80ms)
time zsh -i -c exit
```

---

## 6. 🌙 Raycast Sleep & Wake Automation

### Problem & Goal
The sleep script was keeping terminal emulators (Ghostty/Terminal/iTerm2) open, leaving stray windows and active processes. Furthermore, Ghostty prompted with a modal confirmation dialog ("Terminate running processes?") whenever a background tool or `tmux` session was running, causing the sleep script to block until manually dismissed.

The user workflow uses **Herdr** on Space 1 and requires that **everything except Finder** terminates cleanly before sleep without manual prompts, while preserving background tmux sessions.

### Changes Made
* **`ghostty/.config/ghostty/config`**:
  - Added `confirm-close-surface = false`: Allows Ghostty to close instantly when requested by the sleep script without prompting for confirmation.
  - Background `tmux` sessions remain completely intact because the `tmux` daemon runs detached from the terminal window client.
* **`raycast/.local/bin/raycast-sleep.sh`**:
  - Excluded list narrowed to strictly `{"Finder", "Raycast"}` (`com.apple.finder`, `com.raycast.macos`).
  - All running GUI applications (Herdr, Brave Browser, VS Code, Time Out, Spotify, etc.) are gracefully closed via AppleScript before entering sleep.
  - Bluetooth is powered off via `blueutil --power 0` to prevent connected peripherals (like Bluetooth mice) from waking the Mac.
  - Sleep is triggered via `/usr/bin/pmset sleepnow`.
* **`raycast/.local/bin/raycast-wakeup.sh`**:
  - Restores Bluetooth (`blueutil --power 1`).
  - Launches primary workflow apps: `Brave Browser` (Workspace 2), `Herdr` (Workspace 1), `Time Out` (Workspace 10), and `Stats` (Menu Bar).

### How to Revert
To keep additional applications open during sleep (e.g., Ghostty or Terminal):
1. In `raycast/.local/bin/raycast-sleep.sh`, add application names to `excludedNames` (e.g. `set excludedNames to {"Finder", "Raycast", "Ghostty"}`).
2. In `raycast/.local/bin/raycast-wakeup.sh`, adjust the `open -a` commands.
