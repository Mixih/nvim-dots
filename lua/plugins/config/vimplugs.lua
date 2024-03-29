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
-- force enable folding support
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

-- Hexokinase
vim.g.Hexokinase_optInPatterns = {
    'full_hex',
    'triple_hex',
    'rgb',
    'rgba',
    'hsl',
    'hsla',
}

-- easy align plugin
util.keymap('n', 'ga', '<Plug>(EasyAlign)')
util.keymap('x', 'ga', '<Plug>(EasyAlign)')
