# Personal Config Files

## Nvim Setup

### Download dot Files

Download and move the `nvim` folder into the `~/.config` directory

### Install vim-plug

**UNIX**
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

**WINDOWS (PowerShell)**
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

### Language Servers

Install all language servers that are needed this may take some searching but it shouldn't be too hard with a package manager.

example on Arch:

```
sudo pacman -S lua-language-server
sudo pacman -S clang
sudo npm install -g typescript typescript-language-server
sudo npm install -g emmet-ls
```

Add a snippet to enable language server in `.config/nvim/lua/lsp.lua`

example:

```lua
require('lspconfig').lua_ls.setup{}
```

nvim-lspconfig provides a [configs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md) page that shows all available lsps and example configurations for them.

The following lsps are already configured in my setup:
- Clangd
- lua-ls
- ts-ls
- emmet-ls

### Install Plugins

Inside of neovim:

`:PlugInstall`

This will install all necessary packages. Your neovim configuration is now complete
