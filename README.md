# 🍎 macOS Dotfiles

Clean, blazing-fast dotfiles tailored for macOS (Apple Silicon), managed with [GNU Stow](https://www.gnu.org/software/stow/).

> 🔗 **Other Branches**:
> - 🐧 **[Linux Branch](https://github.com/LegioN2004/dotfiles/tree/linux)** — Arch Linux, Hyprland, i3wm, Kitty, and Linuxbrew configs.
> - 🏠 **[Main Branch](https://github.com/LegioN2004/dotfiles/tree/main)** — Legacy root branch.

---

## ⚡ What's Included

| Component | Description |
| :--- | :--- |
| **Terminal** | [Ghostty](https://ghostty.org/) — GPU-accelerated, native macOS tabs/splits, clean typography (`ghostty/.config/ghostty/config`). |
| **Fish Shell** | **~8ms startup**. Zero heavy frameworks. All aliases converted to native Fish abbreviations (`abbr`) for instant space/enter expansion and zero function wrapper overhead. |
| **Zsh Shell** | **Sub-80ms startup**. Pure DIY setup (Option A) with zero plugin managers. Daily-cached `compinit`, lazy-loaded NVM, and standalone Git aliases (`~/.zsh_git_aliases`). |
| **Raycast Automation** | Custom sleep and wake scripts in `raycast/.local/bin/`: <br>• `raycast-sleep.sh`: Quits heavy apps (Zen, Brave, IDEs), turns off Bluetooth via `blueutil`, and puts Mac to sleep.<br>• `raycast-wakeup.sh`: Restores Bluetooth and relaunches your workspace. |
| **Editor & Multiplexer** | [Neovim](https://neovim.io/) and [Tmux](https://github.com/tmux/tmux) with custom sessionizer. |
| **CLI Utilities** | [Lazygit](https://github.com/jesseduffield/lazygit), [Btop](https://github.com/aristocratos/btop), [Eza](https://github.com/eza-community/eza), [Zoxide](https://github.com/ajeetdsouza/zoxide). |

---

## 🚀 Setup on a New Mac

### 1. Prerequisites

Install Xcode Command Line Tools, Homebrew, and essential tools:

```bash
# 1. Install Command Line Tools
xcode-select --install

# 2. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Add Homebrew to PATH (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv)"

# 4. Install Stow, Git, Fish, Ghostty, and blueutil
brew install stow git fish ghostty blueutil eza zoxide lazygit btop
```

### 2. Clone the Repository

Clone the `macos` branch to `~/dotfiles`:

```bash
git clone -b macos git@github.com:LegioN2004/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Symlink Configurations with GNU Stow

Use Stow to create symlinks into your home directory:

```bash
# Link shells and terminal
stow zsh
stow fish
stow ghostty

# Link tools & workflow
stow tmux
stow nvim
stow lazygit
stow btop
stow raycast
```

> [!TIP]
> If any target file already exists in your home directory (e.g., a default `~/.zshrc`), back it up or remove it before running `stow`.

### 4. Raycast Scripts Setup

1. Open **Raycast Settings** (`Cmd + ,`).
2. Navigate to **Extensions** → **Script Commands**.
3. Click **Add Directory** and select `~/dotfiles/raycast/.local/bin/`.
4. You will now see **Sleep** and **Wake Up** directly available in Raycast.

---

## 🛠️ Maintenance & Tips

- **Edit dotfiles**: Edit files directly inside `~/dotfiles/`. Since they are symlinked with Stow, changes take effect immediately.
- **Push updates**:
  ```bash
  cd ~/dotfiles
  git add .
  git commit -m "update: tweak configuration"
  git push origin macos
  ```
- **Measure Shell Startup**:
  ```bash
  # Fish (should be ~8-15ms)
  time fish -i -c exit

  # Zsh (should be ~70-80ms)
  time zsh -i -c exit
  ```
