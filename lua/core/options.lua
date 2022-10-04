-- Core option settings that should be loaded before anything else.
local api = vim.api
local opt = vim.opt

-- treat terminal as gui (assume that all terminals running nvim are truecolor terminals)
opt.termguicolors = true
-- Apply filetype commands
api.nvim_command('syntax on')
api.nvim_command('filetype on')
api.nvim_command('filetype plugin indent on')
-- no mouse!
opt.mouse=''
