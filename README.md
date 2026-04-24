# linux-config

Dotfiles 配置仓库，用于 Linux/WSL 开发环境管理。支持 Fish、Zsh、Vim 和 Neovim 的快速配置。

## 目录结构

```
linux-config/
├── fish/
│   └── config.fish       # Fish Shell 配置
├── nvim/
│   ├── init.vim          # Neovim 主配置 (vim-plug)
│   ├── plug.vim          # vim-plug 插件管理器
│   ├── systags           # 系统标签文件
│   └── plugged/          # 已安装的插件目录
├── starship.toml         # Starship 提示符配置
├── zshrc                 # Zsh 配置 (oh-my-zsh)
├── ys.zsh-theme          # 自定义 oh-my-zsh 主题
├── vimrc                 # Vim 配置 (vundle)
├── install_fish.sh       # 安装 Fish + Starship + vfox
├── install_zsh.sh        # 安装 Zsh + oh-my-zsh
├── install_nvim.sh       # 安装 Neovim + coc.nvim
├── install_vim.sh        # 安装 Vim (经典)
└── CLAUDE.md             # Claude Code 指导文档
```

## 快速开始

### Fish Shell + Starship (推荐)

```bash
./install_fish.sh
chsh -s /usr/bin/fish  # 设置为默认 shell
```

### Zsh + Oh-My-Zsh

```bash
./install_zsh.sh
```

### Neovim

```bash
./install_nvim.sh
```

### Classic Vim

```bash
./install_vim.sh
```

## 配置详情

### Fish + Starship

- **配置**: `fish/config.fish`, `starship.toml`
- **功能**: vfox 版本管理器、starship 提示符
- **左侧显示**: OS、用户名、目录、Git 分支/状态
- **右侧显示**: 语言版本 (Node/Python/Java/Rust/Go)、日期时间

### Zsh

- **主题**: `ys_my` (自定义主题 `ys.zsh-theme`)
- **插件**: git, zsh-syntax-highlighting, zsh-autosuggestions, zsh-completions
- **框架**: oh-my-zsh
- **版本管理**: nvs (via vfox)

### Neovim

- **插件管理器**: vim-plug
- **LSP/智能补全**: coc.nvim + 13个语言扩展
- **主题**: monokai
- **状态栏**: vim-airline
- **插件**: indentLine, vim-monokai, vim-airline, nerdcommenter, rainbow, nerdtree, nerdtree-git-plugin, tagbar, vim-cpp-enhanced-highlight, vim-snippets

### Vim (经典)

- **插件管理器**: vundle
- **主题**: ron
- **语法检查**: syntastic
- **字典补全**: PHP, CSS, C, C++, JavaScript, HTML

## 手动链接

如需手动配置，可创建以下符号链接：

```bash
# Fish
ln -s ~/linux-config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/linux-config/starship.toml ~/.config/starship.toml

# Zsh
ln -s ~/linux-config/zshrc ~/.zshrc

# Vim
ln -s ~/linux-config/vimrc ~/.vimrc

# Neovim
mkdir -p ~/.config/nvim
ln -s ~/linux-config/nvim/init.vim ~/.config/nvim/init.vim
```
