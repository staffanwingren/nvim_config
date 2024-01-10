My Neovim config
================

## Prerequisites

- Python: Python should be available in the PATH.
- Pynvim: Neovim Python client.
  Installation: `pip install pynvim`
- Packer.nvim: Package manager used to fetch plugins.
  Installation: `git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"`
- LLVM (CLang): Required by Treesitter to compile parsers.
  Installation: `choco install llvm`
- Ripgrep: Required by Telescope to perform grep searches
  Installation: `choco install ripgrep`
- 7Zip: For extracting, obviously, but can't remember exactly what.
- Wget: Not sure it is needed but marked as _Error_ by `:checkhealth` if missing.

## Issues

### Treesitter parser installation

> Treesitter is unable to find Visual Studio installation.

Saw this on computer with VS2022 installed.

Installed Build Tools and C++/CLI for VS2022 and, eventually, it
started working.
