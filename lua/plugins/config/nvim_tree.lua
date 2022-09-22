local nvim_tree = require("nvim-tree")
local util = require('core.util')

nvim_tree.setup({
    sort_by = 'name',
    filesystem_watchers = {
        enable = true
    },
})

util.keymap('n', '<leader>tt', function()
    nvim_tree.toggle(false, false, nil)
end)
util.keymap('n', '<leader>tf', nvim_tree.focus)

