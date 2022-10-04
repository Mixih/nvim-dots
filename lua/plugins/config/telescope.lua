local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local util = require('core.util')

telescope.setup()

util.keymap('n', '<leader>ff', telescope_builtin.find_files)
util.keymap('n', '<leader>fg', telescope_builtin.live_grep)
util.keymap('n', '<leader>fb', telescope_builtin.buffers)
util.keymap('n', '<leader>fhl', telescope_builtin.help_tags)
util.keymap('n', '<leader>fhi', telescope_builtin.highlights)
util.keymap('n', '<leader>fk', telescope_builtin.keymaps)
util.keymap('n', '<leader>fa', telescope_builtin.autocommands)
util.keymap('n', '<leader>fn', telescope.extensions.notify.notify)
