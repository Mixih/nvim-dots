local M = {}

--- Adds a lsp handler to the handlers table at the given key,
--  chaining them in addition order if one already exists.
function M.add_handler(key, handler_callback)
    local existing = vim.lsp.handlers[key]
    local callback = nil
    if type(existing) == 'function' then
        callback = function(err, result, ctx, config)
            existing(err, result, ctx, config)
            handler_callback(err, result, ctx, config)
        end
    else
        callback = handler_callback
    end
    vim.lsp.handlers[key] = callback
end

return M
