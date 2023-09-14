local nvim_tree = require('nvim-tree')
local nvim_tree_api = require('nvim-tree.api')
local util = require('core.util')

nvim_tree.setup({
    sort_by = 'name',
    filesystem_watchers = {
        enable = true,
    },
    git = {
        ignore = false,
    },
})

util.keymap('n', '<leader>tt', function()
    nvim_tree_api.tree.toggle()
end)
util.keymap('n', '<leader>tf', nvim_tree_api.tree.focus)

