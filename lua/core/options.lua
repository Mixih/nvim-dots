local api = vim.api
local opt = vim.opt

opt.termguicolors = true
-- Apply filetype commands
api.nvim_command('syntax on')
api.nvim_command('filetype on')
api.nvim_command('filetype plugin indent on')
