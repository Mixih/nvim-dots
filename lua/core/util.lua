-- Utility module
-- Contains functions useful for setting up neovim using a more declarative api
local M = {}

-- aliases
local api = vim.api
local opt = vim.opt
local opt_local = vim.opt_local

-- removes a key by name from a table
function M.table_pop_key(tbl, key)
    local keyVal = tbl[key]
    tbl[key] = nil
    return keyVal
end

-- Declaratively define autocommands into a group
--
-- Parameters:
--
-- {groupName} name of group
-- {defs} array of tables of form:
--   {
--     events = { events... }
--     opts..
--   }
--
-- Examples:
--
-- * Set automatic spellcheck
--   define_autocmds('spellCheck', {
--     {
--         events = "BufRead", "BufNewFile" },
--         pattern = {"*.md", "*.tex"},
--         command = "setlocal spell"
--       }
--     }
--   })
function M.define_autocmds(groupName, defs)
    local default_opts = {
        group = groupName
    }
    api.nvim_create_augroup(groupName, { clear = true });
    for _, def in ipairs(defs) do
        -- remove the events key and pass the rest to the function
        local events = M.table_pop_key(def, 'events')
        local opts = vim.tbl_extend("keep", default_opts, def)
        api.nvim_create_autocmd(events, opts)
    end
end

function M.define_free_autocmd(def)
    local events = M.table_pop_key(def, 'events')
    api.nvim_create_autocmd(events, def)
end

-- get a callback for autocommand def that modifies the specified  options
function M.get_setopt_callback(options)
    local function callback(event)
        if (options.normalOpts) then
            for key, val in pairs(options.normal) do
                opt[key] = val
            end
        end
        if (options.localOpts) then
            for key, val in pairs(options.localOpts) do
                opt_local[key] = val
            end
        end
    end
    return callback
end

-- Map keys with noremap set by default
function M.keymap(mode, lhs, rhs, opts)
    local options = {
        noremap = true
    }
    local target = rhs
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    -- handle function callback keymaps
    if type(rhs) == 'function' then
        options.callback = rhs
        target = ''
    else
    end
    --  handle buffer keymaps
    if options.buffer ~= nil then
        local bufno = M.table_pop_key(options, 'buffer')
        api.nvim_buf_set_keymap(bufno, mode, lhs, target, options)
    else
        api.nvim_set_keymap(mode, lhs, target, options)
    end
end

-- reverse a string
function M.string_reverse(s)
    local n = #s
    for i = 1, n do
        s[i],s[n] = s[n],s[i]
        n = n - 1
    end
end

-- Get window-id of the first window associated with the buffer <buf>.
function M.bufwinid(buf)
    for _, w in ipairs(api.nvim_list_wins()) do
        if api.nvim_win_get_buf(w) == buf then
          return w
        end
    end
    return -1
end

return M
