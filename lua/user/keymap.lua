-- Miscellanious user keymaps
local util = require('core.util')

-- leader + p/y to paste/yank to system keyboard
util.keymap({'n', 'v'}, '<leader>y', '"+y')
util.keymap({'n', 'v'}, '<leader>p', '"+p')
