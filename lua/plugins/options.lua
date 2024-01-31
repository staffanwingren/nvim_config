return {
  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme gruvbox')
    end,
  },
  {
    'staffanwingren/options',
    dev = true,
    lazy = false,
    priority = 951,
    config = function()
      vim.opt.background = 'dark'
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.numberwidth = 6
      vim.opt.list = true
      vim.opt.ignorecase = true
      vim.opt.smartcase = true
      vim.opt.scrolloff = 8
      vim.opt.softtabstop = 4
      vim.opt.shiftwidth = 4
      vim.opt.expandtab = true
      vim.opt.textwidth = 80

      vim.opt.signcolumn = 'yes'
      vim.opt.colorcolumn = '81'

      vim.opt.path:append('**')

      vim.opt.grepprg = 'rg -S --vimgrep'
      vim.opt.grepformat = '%f:%l:%c:%m'

      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

      vim.diagnostic.config({
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        float = {
          source = 'always',
        },
      })

      vim.g.netrw_menu = 0
      vim.g.netrw_banner = 0
      vim.g.netrw_preview = 1
      vim.g.netrw_liststyle = 0
      --vim.g.netrw_keepdir=1
      vim.g.netrw_winsize = 25
      vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
    end,
  },
}
