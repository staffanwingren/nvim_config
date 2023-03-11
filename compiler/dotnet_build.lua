--vim.opt.errorformat = '%f(%l\\,%c):%\\s%t%\\w%\\+%\\s%m%\\s[%.%#]'
--vim.opt.makeprg = 'dotnet build --nologo -v q -clp:NoSummary -p:GenerateFullPaths=true'
vim.g.current_compiler = 'dotnet_build'
vim.cmd([[
    CompilerSet errorformat=%f(%l\\,%c):%\\s%t%\\w%\\+%\\s%m%\\s[%.%#]
    CompilerSet makeprg=dotnet\ build\ --nologo\ -v\ q\ -clp:NoSummary\ -p:GenerateFullPaths=true
]])
