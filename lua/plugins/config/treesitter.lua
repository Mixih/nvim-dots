local treesitter = require('nvim-treesitter.configs')
local util = require('core.util')

local opt = vim.opt

treesitter.setup {
    auto_install = true,
    highlight = {
        enable = true,
        disable = { latex },
        use_languagetree = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
}

--opt.foldexpr = 'nvim_treesitter#foldexpr()'
