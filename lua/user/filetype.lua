-- unified file-type dependent dispatch hook
local util = require('core.util')
local opt = vim.opt

-- table of overrides to apply by file extension
local file_ext_overrides = {
    ['.mly'] = {
        ft = 'menhir'
    },
    ['.mll'] = {
        ft = 'ocamllex'
    }
}

local function custom_ft_override(event)
    local ext = string.match(event.file, '^.+(%..+)$')
    local ext_override = file_ext_overrides[ext]
    if ext_override then
        if ext_override.ft then
            opt.ft = ext_override.ft
        end
    end
end

util.define_autocmds('SetCustomFiletypes', {
    {
        events = { 'BufNewFile', 'BufRead' },
        pattern = '*',
        callback = custom_ft_override
    }
})

