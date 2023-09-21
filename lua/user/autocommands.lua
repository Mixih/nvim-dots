local util = require('core.util')
local api = vim.api

-- this function and its associated autocommand return the cursor to its last
-- known position when re-opening a file.
local function return_cursor(event)
    if (vim.fn.line('\'"') > 0 and vim.fn.line('\'"') <= vim.fn.line('$')) then
        api.nvim_command('normal! g`"')
    end
    return false
end

util.define_autocmds('ReturnCursorPos', {
    {
        events = { 'BufReadPost' },
        pattern = '*',
        callback = return_cursor,
    }
})

-- Set automatic spellcheck activation rules
util.define_autocmds('SetSpelling', {
    {
        events = { 'BufRead', 'BufNewFile' },
        pattern = { '*.md', '*.tex' },
        callback = util.get_setopt_callback({
            localOpts = { spell = true },
        }),
    },
    {
        events = { 'FileType' },
        pattern = { 'asciidoc', 'gitcommit', 'text' },
        callback = util.get_setopt_callback({
            localOpts = { spell = true },
        }),
    },
})

-- set indentation rule overrides
util.define_autocmds('CustomIndentationRules', {
    -- two space indent rule
    {
        events = { 'FileType' },
        pattern = { 'dune', 'html', 'htmldjango', 'json', 'ocaml', 'yaml' },
        callback = util.get_setopt_callback({
            localOpts = {
                tabstop = 8,
                shiftwidth = 2,
                softtabstop = 2,
                expandtab = true,
            },
        })
    },
    -- hard tab char rules
    {
        events = { 'FileType' },
        pattern = 'make',
        callback = util.get_setopt_callback({
            localOpts = {
                tabstop = 8,
                shiftwidth = 8,
                softtabstop = 0,
                expandtab = false,
            },
        })
    },
})

-- rule and callback to remove trailing spaces from supported files
-- automatically
local function strip_trailing_spaces_callback(event)
    util.define_buffer_autocmd({
        events = { 'BufWritePre' },
        command = '%s/\\s\\+$//e',
    })
end

util.define_autocmds('StripTrailingSpaces', {
    {
        events = { 'FileType' },
        pattern = { 'asm', 'c', 'cpp', 'gas', 'lua', 'java', 'kotlin',
                    'ocaml', 'python', 'systemverilog', 'tex', 'verilog',
                    'vhdl', 'vim'},
        callback = function (event)
            util.define_buffer_autocmd({
                events = { 'BufWritePre' },
                command = '%s/\\s\\+$//e',
            })
        end
    }
})

util.define_autocmds('SetFiletypeOverrides', {
    {
        events = { 'BufRead', 'BufNewFile' },
        pattern = '*.S',
        callback = util.get_setopt_callback({
            localOpts = { ft = 'gas' },
        }),
    }
})
