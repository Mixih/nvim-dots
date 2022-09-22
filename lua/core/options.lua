local util = require('core.util')

local opt = vim.opt
local api = vim.api

opt.termguicolors = true
opt.ttimeoutlen = 10

-- default indentation group
opt.tabstop = 8
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.cursorline = true
opt.number = true
opt.textwidth = 90
opt.list = true -- mark special whitespace
opt.listchars = {
    tab = '»·',
    trail = '•',
    nbsp = '⎵',
    precedes = '←',
    extends = '→',
}
-- mark line continuations
opt.showbreak = '↪\\'
-- apply visual indenting for line continuations
opt.breakindent = true
opt.signcolumn = 'auto:2'
-- disallow cursor changes
opt.guicursor = ''
-- set folding method
opt.foldmethod = 'expr'

-- Apply filetype commands
api.nvim_command('syntax on')
api.nvim_command('filetype on')
api.nvim_command('filetype plugin indent on')

if vim.api.nvim_call_function('has', {'gui_running'}) then
    util.keymap('i', '<C-Space>', '<C-n')
else
    util.keymap('i', '<C-Space', '')
end
