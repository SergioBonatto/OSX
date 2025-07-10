# OSX - Development Configuration

This repository contains my custom configurations for development on macOS, including Vim, Zsh, Ghostty terminal settings, and custom themes.

## 📁 Repository Structure

```
OSX/
├── .vimrc                 # Main Vim configuration
├── .zshrc                 # Zsh shell configuration
├── ghostty.config         # Ghostty terminal configuration
├── config/                # Modular Vim configurations
│   ├── plugins.vim        # Plugin management
│   ├── settings.vim       # Basic settings
│   ├── mappings.vim       # Keyboard shortcuts
│   ├── theme.vim          # Theme configuration
│   ├── plugin-config.vim  # Plugin-specific configuration
│   └── statusline.vim     # Status line configuration
├── atomonelight.vim       # Custom Atom One Light theme
├── bonatto.vim            # Custom Bonatto theme
├── statusline.vim         # Custom status line
├── wallpaper-black.png    # Wallpaper
└── reuvolucionario.jpeg   # Additional image
```

## 🚀 Key Features

### Vim Configuration
- **Modular configuration**: Separated into specific files for easy maintenance
- **Essential plugins**: NERDTree, CtrlP, ALE, Fugitive, and others
- **Custom themes**: Atom One Light and exclusive Bonatto theme
- **Optimized shortcuts**: Enhanced navigation and productivity
- **OCaml support**: Automatic configuration for development

### Zsh Configuration
- **Oh My Zsh**: Complete framework with useful plugins
- **Theme**: cdimascio-lambda
- **Included plugins**:
  - git, zsh-syntax-highlighting, zsh-autosuggestions
  - catimg, extract, jsontools
- **Custom aliases**: For Git, Vim, and common commands
- **Doom Emacs integration**: Configuration for joint usage

### Ghostty Terminal
- **Theme**: OneHalfLight with custom colors
- **Optimized configuration**: For development and productivity
- **Zsh integration**: Shell integration enabled
- **Modern interface**: macOS tab style

## 📦 Installation

### Prerequisites
- macOS
- [Homebrew](https://brew.sh)
- [Oh My Zsh](https://ohmyz.sh)
- [Vim-Plug](https://github.com/junegunn/vim-plug) (for Vim plugins)
- [Ghostty Terminal](https://ghostty.org) (optional)

### Quick Installation

1. **Clone the repository:**
```bash
git clone https://github.com/SergioBonatto/OSX.git ~/.config/osx-dotfiles
cd ~/.config/osx-dotfiles
```

2. **Backup existing configurations:**
```bash
mv ~/.vimrc ~/.vimrc.backup 2>/dev/null || true
mv ~/.zshrc ~/.zshrc.backup 2>/dev/null || true
```

3. **Create symbolic links:**
```bash
# Vim
ln -sf ~/.config/osx-dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim/config
ln -sf ~/.config/osx-dotfiles/config/* ~/.vim/config/

# Zsh
ln -sf ~/.config/osx-dotfiles/.zshrc ~/.zshrc

# Ghostty (if installed)
mkdir -p ~/.config/ghostty
ln -sf ~/.config/osx-dotfiles/ghostty.config ~/.config/ghostty/config
```

4. **Install Vim plugins:**
```bash
vim +PlugInstall +qall
```

5. **Reload configurations:**
```bash
source ~/.zshrc
```

## 🎨 Custom Themes

### Atom One Light
- Theme based on the official Atom theme
- Optimized for clarity and readability
- Harmonious colors for long coding sessions

### Bonatto Theme
- Exclusive custom theme
- Unique and modern color palette
- Distinctive styles for code elements

## ⌨️ Main Shortcuts

### Vim
- **Leader key**: `,` (comma)
- **Quick navigation**: `Shift+j/k` for 6-line movement
- **Word navigation**: `Shift+h/l` for beginning/end of word
- **Windows**: `Ctrl+h/j/k/l` for panel navigation
- **Resize**: Arrow keys to adjust windows

### Zsh Aliases
- **Git shortcuts**: `push`, `pull`, `commit`, `add`, `status`
- **Navigation**: `q` (exit), `c` (clear), `cdd` (cd ..)
- **Vim**: `v`, `im`, `vom` (all open vim)

## 🔧 Customization

### Adding New Vim Plugins
Edit `config/plugins.vim`:
```vim
Plug 'author/plugin-name'
```
Run `:PlugInstall` in Vim.

### Modifying Shortcuts
Edit `config/mappings.vim` to add or modify shortcuts.

### Customizing Themes
- Modify `atomonelight.vim` or `bonatto.vim`
- Or create your own theme based on the existing structure

## 🤝 Contributing

Feel free to:
- Report bugs
- Suggest improvements
- Submit pull requests
- Share your customizations

## 📄 License

This project is under the MIT license. See the LICENSE file for more details.

## 📞 Contact

- **Author**: Bonatto
- **GitHub**: [SergioBonatto](https://github.com/SergioBonatto/)

---

*These configurations have been tested on macOS and represent my personal development environment. Adapt as needed for your workflow.*
