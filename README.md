My Neovim config
================

## Prerequisites

- Python: Python should be available in the PATH. Using winget or chocolatey to
  install on Windows does not seem to be compatible with Neovim.
- Pynvim: Neovim Python client (see :help provider-python)
  Installation: `pip install pynvim`
- LLVM (CLang): Required by Treesitter to compile parsers.
  Installation: `choco install llvm`
- Ripgrep: Required by Telescope to perform grep searches
  Installation: `choco install ripgrep`
- 7Zip: For extracting, obviously, but can't remember exactly what.
- Wget: Not sure it is needed but marked as _Error_ by `:checkhealth` if missing.
- CMake: Required to build fzf-native.
  Installation: `winget install Kitware.CMake`
- For NeoAI (OpenAI) the `OPENAI_API_KEY` environment variable must be set to a
  valid key.
