vim.g.current_compiler = 'dotnet_build_warn'
vim.cmd([[
    CompilerSet errorformat=%f(%l\\,%c):%\\s%t%\\w%\\+%\\s%m[%o]
    CompilerSet makeprg=dotnet\ build\ --nologo\ -v\ q\ -clp:NoSummary\ -p:GenerateFullPaths=true\ -warnaserror
]])

