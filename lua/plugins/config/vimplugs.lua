-- file to configure vim style plugins that need global vim vars to be set before the
-- plugin is loaded
local util = require('core.util')

-- aliases
local opt_local = vim.opt_local

-- ultisnips config
vim.g.UltiSnipsExpandTrigger        = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger   = '<Tab>'
vim.g.UltiSnipsJumpBackwardsTrigger = '<S-Tab>'

-- vimtex config
vim.g.vimtex_fold_enabled = true
--vim.opt.foldexpr='vimtex#fold#level(v:lnum)'
util.define_autocmds('VimtexFolding', {
    {
        events = 'FileType',
        pattern = 'tex',
        callback = function (event)
            util.define_buffer_autocmd({
                events = 'BufWinEnter',
                callback = function()
                    opt_local.foldexpr = 'vimtex#fold#level(v:lnum)'
                    opt_local.foldtext = 'vimtex#fold#text()'
                    vim.api.nvim_command('normal zR')
                end
            })
        end
    }
})
