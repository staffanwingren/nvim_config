local has_telescope, telescope = pcall(require, 'telescope')
if has_telescope then
    telescope.load_extension('dap')
else
    print('Configuration: telescope not available')
end
