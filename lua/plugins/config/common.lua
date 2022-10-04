local nvim_dev_icons = require('nvim-web-devicons')
local better_escape = require('better_escape')

nvim_dev_icons.setup({
    default = true,
})

-- better escape config
better_escape.setup({
    mapping = { 'jk', 'kj' },
    timeout = 100,
})
