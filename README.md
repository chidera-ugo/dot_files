# Dotfiles Setup Guide

This directory contains configuration files for various tools. Follow the steps below after cloning these dotfiles.

## Initial Setup

1. **Clone dotfiles**
   ```bash
   git clone https://github.com/chidera-ugo/dot_files ~/.config
   ```

## Neovim Setup

1. **Install Neovim** (>= 0.8.0)
   ```bash
   # macOS
   brew install neovim
   ```

2. **Install dependencies**
   ```bash
   # Required for Telescope and other plugins
   brew install ripgrep fd
   ```

3. **Start Neovim**
   ```bash
   nvim
   ```
   Plugins will automatically install via lazy.nvim on first launch.

### Sort Imports
Install global npm packages for import sorting functionality:
```bash
npm install -g import-sort-cli import-sort-parser-babylon import-sort-style-eslint
```

## Tmux Setup

1. **Install tmux**
   ```bash
   # macOS
   brew install tmux
   ```

2. **Install TPM (Tmux Plugin Manager)**
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

3. **Start tmux and install plugins**
   ```bash
   tmux
   # Inside tmux, press: Prefix + I (usually Ctrl-b + I)
   ```

## Additional Setup

- Ensure your shell is properly configured to source these config files
- Some plugins may require additional language servers or tools to be installed
- Run `:checkhealth` in Neovim to verify everything is working correctly
