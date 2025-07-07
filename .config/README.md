# Dotfiles

A carefully curated collection of configuration files for a productive development environment on macOS.

## Features

- Neovim - LazyVim-based configuration with custom plugins
- Tmux - Enhanced terminal multiplexer with vim-style navigation
- AeroSpace - Tiling window manager for macOS
- Zsh - Shell configuration with modern tooling
- Consistent theming across all tools

## Tools Included

### Core Applications
- **Neovim** - Modern Vim-based editor with LSP support
- **Tmux** - Terminal multiplexer for session management
- **AeroSpace** - i3-inspired tiling window manager for macOS
- **Zsh** - Enhanced shell with custom configuration

### Development Tools
- **TMS** - Tmux session manager
- **Yazi** - Terminal file manager

## Quick Start

### Prerequisites
- macOS 12.0 or later
- [Homebrew](https://brew.sh/) package manager
- [GNU Stow](https://www.gnu.org/software/stow/) for symlink management
- Git

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/SimonOneNineEight/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Install core applications**:
   ```bash
   # Install Neovim
   brew install neovim
   
   # Install Tmux
   brew install tmux
   
   # Install AeroSpace
   brew install --cask nikitabobko/tap/aerospace
   
   # Install additional tools
   brew install yazi tms
   
   # Install GNU Stow
   brew install stow
   ```

3. **Deploy configurations using Stow**:
   ```bash
   # From the ~/.dotfiles directory
   stow .
   ```

4. **Install plugins**:
   ```bash
   # Neovim plugins will install automatically on first launch
   nvim
   
   # Tmux Plugin Manager
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   # Press prefix + I in tmux to install plugins
   ```

## Structure

```
~/.dotfiles/
├── .config/
│   ├── nvim/           # Neovim configuration
│   │   ├── init.lua    # Main config entry point
│   │   ├── lua/
│   │   │   ├── config/ # Core configuration
│   │   │   └── plugins/ # Plugin configurations
│   │   └── lazy-lock.json # Plugin lockfile
│   ├── tmux/           # Tmux configuration
│   │   ├── tmux.conf   # Main tmux config
│   │   └── plugins/    # Tmux plugins (git submodules)
│   ├── aerospace/      # AeroSpace window manager
│   │   └── aerospace.toml
│   ├── yazi/           # File manager config
│   └── tms/            # TMS session manager
├── .gitignore          # Git ignore patterns
└── README.md           # This documentation
```

## Configuration Details

### Neovim
- **Base**: LazyVim distribution
- **Package Manager**: Lazy.nvim
- **Language Support**: LSP, Treesitter, DAP
- **Key Features**:
  - Modern plugin ecosystem
  - Intelligent autocompletion
  - Git integration
  - File exploration with Oil.nvim
  - Tailwind CSS support

### Tmux
- **Prefix**: `Ctrl+O`
- **Key Features**:
  - Vim-style navigation
  - Mouse support
  - Custom split bindings (`|` and `_`)
  - Plugin manager integration
  - Session persistence

### AeroSpace
- **Layout**: Tiling window manager
- **Key Features**:
  - i3-inspired keybindings
  - Sketchybar integration
  - Auto-start at login
  - Workspace management

## Key Bindings

### Tmux
- `Ctrl+O` - Prefix key
- `Prefix + |` - Split horizontally
- `Prefix + _` - Split vertically
- `Prefix + r` - Reload config
- `Alt+H/L` - Navigate windows
- `Alt+J/K` - Scroll mode

### Neovim
- `<leader>` - Space key
- Standard LazyVim keybindings apply
- Custom plugin configurations included

## Theming

All tools are configured with a consistent dark theme for a cohesive visual experience.

## Updates

To update configurations:

```bash
cd ~/.dotfiles
git pull origin main

# Update Neovim plugins
nvim --headless "+Lazy! sync" +qa

# Update Tmux plugins
tmux source ~/.config/tmux/tmux.conf
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Acknowledgments

- [LazyVim](https://github.com/LazyVim/LazyVim) - Excellent Neovim distribution
- [AeroSpace](https://github.com/nikitabobko/AeroSpace) - Tiling window manager
- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) - Plugin management
- [GNU Stow](https://www.gnu.org/software/stow/) - Symlink farm manager
