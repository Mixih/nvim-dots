-- file to configure vim style plugins that need global vim vars to be set before the
-- plugin is loaded
local util = require('core.util')

-- ultisnips config
vim.g.UltiSnipsExpandTrigger        = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger   = '<Tab>'
vim.g.UltiSnipsJumpBackwardsTrigger = '<S-Tab>'

-- override questionable polyglot features
--vim.g.polyglot_disabled = { 'autoindent' }

-- vimtex config
vim.g.vimtex_fold_enabled = true
--vim.opt.foldexpr='vimtex#fold#level(v:lnum)'
util.define_autocmds('VimtexFolding', {
    {
        events = 'FileType',
        pattern = 'tex',
        callback = function (event)
            util.define_free_autocmd({
                events = 'BufWinEnter',
                pattern = '*',
                callback = function()
                    local setopts = util.get_setopt_callback({
                        localOpts = {
                            foldexpr = 'vimtex#fold#level(v:lnum)',
                            foldtext = 'vimtex#fold#text()'
                        }
                    })
                    setopts()
                    vim.api.nvim_command('normal zR')
                end
            })
        end
    }
})
