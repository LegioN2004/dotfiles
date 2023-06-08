# DOTFILES

- This is for an [Arch](archlinux.org) Linux machine
- These are my personal dotfiles for mainly my Linux machine 
  - They are in this unusual dir order due to my symlink style configuration for using **GNU/STOW** in order to make my life easier since I am using version control to maintain and backup these stuff.
- I use **[GNU/Stow](https://www.gnu.org/software/stow/)** to manage my dotfiles as well as keep track of them in GitHub using Git.
- Here I have a few configs of free and open source softwares as the directory names suggests
- I have gotten a lot of help while setting them up from StackOverflow; reddit pages like [r/neovim](https://www.reddit.com/r/neovim/), [r/linux](https://www.reddit.com/r/linux/), [r/linuxmasterrace](https://www.reddit.com/r/linuxmasterrace/), [r/archlinux](https://www.reddit.com/r/archlinux/), [r/linux4noobs](https://www.reddit.com/r/linux4noobs/), [r/linuxquestions](https://www.reddit.com/r/linuxquestions/); and Google.
- Copied a lot of stuff from the one and only [UNIXPORN](https://www.reddit.com/r/unixporn/)
- ChrisTitusTech, Brodie-Robertson

## [UNIXPORN](https://www.reddit.com/r/unixporn/) stuff (tiling window managers) _just for fun_

### Hyprland rice

- Waybar is from [s1mpleman](https://github.com/1amSimp1e/dots)

![first Hyprland ss](./assets/images/archrice4thhyprland1st.png)
![second Hyprland ss](./assets/images/archrice4thhyprland1stkasecond.png)

### i3wm rice

![nvim, tmux, i3 screenshot](./assets/images/archrice3rd.png)

## Neovim configuration

![one nvim pic](./assets/images/nvim-showed.png)
<!-- ![second nvim pic](./assets/images/nvim-showed2.png) -->

- I use NEOVIM(a better version of vim, more appropiately a better fork) because it is one of the best editor I have ever used. I have configured it to my liking with all the keybinds ready to use so that my hands remain in the keyboard. There are still some extension left.
- Don't go for the exit vim memes, they're bluff. Use it to its full potential in its vanilla state
- TODOS:
  - [ ] Configure DAP for java, cpp, and other languages to be used later on. 
  - [ ] make the ui better with the transparency and stuff.

- They helped me setup nvim like the one you see in the pics.
  - [ThePrimeagen](https://www.youtube.com/theprimeagen) is the legendary vimmer, he made me step into nvim/vim. One of the best channel.
  - [Devaslife](https://www.youtube.com/devaslife) is the vimmer dev, he primarily uses nvim and I follow him a lot. His frontend and backend vids are amazing.
  - The [r/neovim](https://www.reddit.com/r/neovim/) reddit page, google helped of course.

**This configuration requires [Neovim](https://neovim.io/) (>= 0.8)**

#### **Plugins used** 
<!-- TODO: more plugins to be added -->
**UI** stuff
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - The main thing, a **plugin manager** , Lazy. Legendary folke, tpope.
  - [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - A dark and light Neovim **theme/colorscheme** written in Lua ported from the VSCode's tokyonight theme.
  - other **colorschemes** include ones : 
    1. [svrana/neosolarized.nvim](https://github.com/svrana/neosolarized.nvim) - A truecolor, solarized dark colorscheme
    2. [gruvbox-community/gruvbox](https://github.com/gruvbox-community/gruvbox) - One of the legendary colorschemes **Gruvbox** 
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure Neovim **statusline** written in Lua
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - Lua `fork` of vim-web-devicons for neovim, for eyecandy **icons**
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - **Git signs** for better tracking for buffers
- [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - **Distraction-free mode**
<!-- - [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter -->
<!-- - [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) - A snazzy bufferline -->

**LSP** stuff 
  - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's **built-in LSP**
  - [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim) - VSCode-like **pictograms**
  - [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - **Snippet Engine** for Neovim written in Lua
  - [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A **completion engine** plugin for neovim written in Lua
  - [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp **source** for neovim's built-in LSP
  - [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for **buffer** words
  - [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  - [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - **Portable package manager** for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters
  - [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - **Extension** to mason.nvim that makes it easier to use lspconfig with mason.nvim
  - [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - A light-weight lsp plugin based on neovim's built-in lsp with a highly **performant UI**

**Utilities** must have
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim. Must have for **The best Syntax hightlighting**.
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable **fuzzy finder** for lsp stuff, grep, find_files,etc can be extended to make it a beast.
- [nvim-tree/nvim-tree](https://github.com/nvim-tree/nvim-tree) - **File Browser**
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - **Autopairs** i.e autoclosing braces, quotes, etc.
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Use treesitter to **auto close** and **auto rename** html tag
- [dinhhuy258/git.nvim](https://github.com/dinhhuy258/git.nvim) - A simple clone of the plugin vim-fugitive, will implement this later on for now I use the following
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) - A Git wrapper so awesome, it should be illegal
- [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb) - A GitHub extension for fugitive.vim
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - **Markdown live preview**

## Shell setup (Linux) (shall also work in macOS)

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager for fish
- [Tide](https://github.com/IlanCosman/tide) - Shell theme. Use version 5: `fisher install ilancosman/tide@v5`
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use JetBrainsMono NF.
- [z](https://github.com/jethrokuan/z) - Directory jumping using `z a-folder-name`
- [Exa](https://the.exa.website/) - better `ls` replacement
- [ghq](https://github.com/x-motemen/ghq) - Local Git repository organizer
- [peco](https://github.com/peco/peco) - Interactive filtering

## PowerShell setup (Windows), is in another [repo](https://github.com/LegioN2004/some-other-stuff/tree/main/Windows/PowerShell7)

- Made a lot of unix style commands aliased in powershell.
- [Scoop](https://scoop.sh/) - A command-line installer
- [Git for Windows](https://gitforwindows.org/)
- [Terminal Icons](https://github.com/devblackops/Terminal-Icons) - Folder and file icons
- [PSReadLine](https://docs.microsoft.com/en-us/powershell/module/psreadline/) - Cmdlets for customizing the editing environment, used for autocompletion
- [z](https://www.powershellgallery.com/packages/z) - Directory jumper
- [PSFzf](https://github.com/kelleyma49/PSFzf) - Fuzzy finder
<!-- 2. - [Oh My Posh](https://ohmyposh.dev/) - Prompt theme engine -->

## How to use

Watch these video tutorials of [Devaslife](https://www.youtube.com/devaslife):

1. [dev workflow using tmux and vim](https://www.youtube.com/watch?v=sSOfr2MtRU8&list=PLxQA0uNgQDCICMRwlOzWAZBPL05XBC_br&index=10)
4. [Fish shell workflow for coding](https://www.youtube.com/watch?v=KKxhf50FIPI)
5. [How to set up PowerShell prompt with Oh My Posh on Windows 11](https://www.youtube.com/watch?v=5-aK2_WwrmM)
<!-- 2. [vim setup to speed up JavaScript coding for my Electron and React Native apps](https://www.youtube.com/watch?v=UZBjt04y4Oo&list=PLxQA0uNgQDCICMRwlOzWAZBPL05XBC_br&index=3) -->
<!--    - [Blogpost](https://dev.to/craftzdog/my-vim-setup-to-speed-up-javascript-coding-for-my-electron-and-react-native-apps-4ebp) -->
<!-- 3. [A productive command-line Git workflow for indie app developers](https://www.youtube.com/watch?v=qKpY7t5m35k&list=PLxQA0uNgQDCICMRwlOzWAZBPL05XBC_br&index=4) -->
<!--    - [Blogpost](https://dev.to/craftzdog/a-productive-command-line-git-workflow-for-indie-app-developers-k7d) -->
