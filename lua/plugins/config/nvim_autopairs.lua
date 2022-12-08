local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local handlers = require('nvim-autopairs.completion.handlers')
local nvim_autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

nvim_autopairs.setup()

-- auto add open paren for functions and methods
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

-- rule for c style comment
nvim_autopairs.add_rule(Rule('/*', '*/', {'c', 'cpp'}))
-- rule for ocaml style comment
nvim_autopairs.add_rule(Rule('(*', '*)', {'ocaml'}))
