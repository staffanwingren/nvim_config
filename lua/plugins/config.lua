local has_telescope, telescope = pcall(require, 'telescope')
if has_telescope then
    vim.schedule(function()
        if packer_plugins['telescope-dap.nvim'] then
            telescope.load_extension('dap')
        else
            print('Configuration: telescope-dap extension not available')
        end
    end)
else
    print('Configuration: telescope not available')
end

local has_telekasten, telekasten = pcall(require, 'telekasten')

if has_telekasten then
    telekasten.setup({
      home = vim.fn.expand("~/Dropbox/slbx"),
    })
end
