-- Config file for options that should override options set by plugins
local util = require('core.util')
local opt = vim.opt

-- default indentation group
opt.tabstop = 8
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- shorten timeouts to make changing modes more responsive
opt.ttimeoutlen = 10

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
-- disallow cursor shape changes
opt.guicursor = ''
-- set default folding method
opt.foldmethod = 'expr'

-- fix control space mapping on certain broken terminals
if vim.api.nvim_call_function('has', {'gui_running'}) then
    util.keymap('i', '<C-Space>', '<C-n')
else
    util.keymap('i', '<C-Space', '')
end
