return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        version = "^1.0.0",
      },
    },
    cmd = {
      "Telescope",
    },
    keys = {
      {
        '<leader>tb', ':Telescope buffers path_display={"tail"}<CR>', mode = 'n', desc = 'Telescope buffer search'
      },
      {
        '<leader>tf', ':Telescope find_files path_display={"tail"}<CR>', mode = 'n', desc = 'Telescope file search'
      },
      {
        '<leader>tF', ':Telescope git_files path_display={"tail"}<CR>', mode = 'n', desc = 'Telescope git search'
      },
      {
        '<leader>tg', ':Telescope live_grep<CR>', mode = 'n', desc = 'Telescope live grep'
      },
      {
        '<leader>th', ':Telescope help_tags<CR>', mode = 'n', desc = 'Telescope help search'
      },
      {
        '<leader>tj', ':Telescope jumplist<CR>', mode = 'n', desc = 'Telescope jumplist'
      },
      {
        '<leader>tr', ':Telescope registers<CR>', mode = 'n', desc = 'Telescope registers'
      },
      {
        '<leader>ts', ':Telescope lsp_document_symbols<CR>', mode = 'n', desc = 'Telescope symbol search'
      },
      {
        '<leader>tS', ':Telescope lsp_workspace_symbols<CR>', mode = 'n', desc = 'Telescope symbol search'
      },
      {
        '<leader>tt', ':Telescope resume<CR>', mode = 'n', desc = 'Telescope previous search'
      },
      {
        '<leader>tp', ':Telescope projects<CR>', mode = 'n', desc = 'Telescope projects'
      },
      {
        '<leader>tG', ":lua require'telescope'.extensions.live_grep_args.live_grep_args()<CR>", mode = 'n', desc = 'Telescope grep w. args'
      },
    },
    config = function(_, _)
      local ts = require 'telescope'
      ts.setup {
        extensions = {
          project = {},
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          live_grep_args = {
            auto_quoting = false,
          },
        },
      }

      ts.load_extension 'fzf'
      ts.load_extension 'projects'
      ts.load_extension 'dap'
      ts.load_extension 'live_grep_args'
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    lazy = true,
  },
  {
    'ahmedkhalf/project.nvim',
    lazy = true,
    opts = {
      -- Manual mode doesn't automatically change your root directory, so you have
      -- the option to manually do so using `:ProjectRoot` command.
      manual_mode = true,

      -- Methods of detecting the root directory. **"lsp"** uses the native neovim
      -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
      -- order matters: if one is not detected, the other is used as fallback. You
      -- can also delete or rearangne the detection methods.
      detection_methods = { "lsp", "pattern" },

      -- All the patterns used to detect root dir, when **"pattern"** is in
      -- detection_methods
      patterns = { ".git", "*.sln", "Makefile", "_darcs", ".hg", ".bzr", ".svn", },

      -- Table of lsp clients to ignore by name
      -- eg: { "efm", ... }
      ignore_lsp = {},

      -- Don't calculate root dir on specific directories
      -- Ex: { "~/.cargo/*", ... }
      exclude_dirs = {},

      -- Show hidden files in telescope
      show_hidden = false,

      -- When set to false, you will get a message when project.nvim changes your
      -- directory.
      silent_chdir = true,

      -- What scope to change the directory, valid options are
      -- * global (default)
      -- * tab
      -- * win
      scope_chdir = 'tab',

      -- Path where project.nvim will store the project history for use in
      -- telescope
      datapath = vim.fn.stdpath("data"),
    },
    config = function(_, opts)
      require 'project_nvim'.setup(opts)
    end,
  },
}
