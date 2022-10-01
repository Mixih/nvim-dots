local M = {}

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
M.fresh_install = false


if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.cmd('packadd packer.nvim')
    M.fresh_install = true
end

return M
