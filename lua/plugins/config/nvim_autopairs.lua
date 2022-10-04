local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local handlers = require('nvim-autopairs.completion.handlers')
local nvim_autopairs = require('nvim-autopairs')

nvim_autopairs.setup()
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
    filetypes = {
        -- "*" is a alias to all filetypes
        ["*"] = {
            ["("] = {
                kind = {
                    cmp.lsp.CompletionItemKind.Function,
                    cmp.lsp.CompletionItemKind.Method,
                },
                handler = handlers["*"]
            }
        },
    },
}))
