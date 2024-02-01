return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>tb', ':Telescope buffers path_display={"tail"}<CR>',    mode = 'n', desc = 'Telescope buffer search' },
      { '<leader>tf', ':Telescope find_files path_display={"tail"}<CR>', mode = 'n', desc = 'Telescope file search' },
      { '<leader>tF', ':Telescope git_files path_display={"tail"}<CR>',  mode = 'n', desc = 'Telescope git search' },
      { '<leader>tg', ':Telescope live_grep<CR>',                        mode = 'n', desc = 'Telescope live grep' },
      { '<leader>th', ':Telescope help_tags<CR>',                        mode = 'n', desc = 'Telescope help search' },
      { '<leader>tj', ':Telescope jumplist<CR>',                         mode = 'n', desc = 'Telescope jumplist' },
      { '<leader>tr', ':Telescope registers<CR>',                        mode = 'n', desc = 'Telescope registers' },
      { '<leader>ts', ':Telescope lsp_workspace_symbols<CR>',            mode = 'n', desc = 'Telescope symbol search' },
      { '<leader>tt', ':Telescope resume<CR>',                           mode = 'n', desc = 'Telescope previous search' },
      { '<leader>tp', ':Telescope project<CR>',                          mode = 'n', desc = 'Telescope project' },
    },
    config = function(_, _)
      local ts = require 'telescope'
      ts.setup {
        extensions = {
          project = {
          },
        },
      }

      ts.load_extension('project')
    end
  },
  { 'nvim-telescope/telescope-project.nvim' }
}
