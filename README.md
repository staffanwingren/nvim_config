My Neovim config
================

## Prerequisites

- Packer.nvim: Package manager used to fetch plugins.
  Installation: `git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"`
- LLVM (CLang): Required by Treesitter to compile parsers.
  Installation: `choco install llvm`
  Notes: Need to run `:PackerCompile` & `:PackerInstall` to fetch specified plugins.
- Ripgrep: Required by Telescope to perform grep searches
  Installation: `choco install ripgrep`

##  Setup

Execute `:PackerCompile` followed by `:PackerInstall`.

## Issues

Treesitter is unable to find Visual Studio installation (for Clang).
Saw this on computer with VS2022 installed.
