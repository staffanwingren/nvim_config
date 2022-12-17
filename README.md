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
