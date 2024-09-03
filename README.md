# Quick Start for my neovim config
1. Clone this repo, and move the nvim folder into the .config file
2. Install packer nvim
## for Linux
```
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
## for Windows (Powershell)
```
$ git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
3. Go into lua/abuharth/packer.lua and run:
   `:so` and `:PackerInstall`
## Requirements
- [Any NerdFont](https://www.nerdfonts.com/font-downloads)
- Python
   - Pyright `pip install pyright`
- node
