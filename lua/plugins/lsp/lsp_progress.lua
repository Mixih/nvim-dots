local lsp_util = require('plugins.lsp.util')

M = {}

local messages = {}

function M.progress_handler(err, result, ctx, config)
    -- print(string.format('err: %s, result %s, ctx: %s, config %s',
    --       vim.inspect(err), vim.inspect(result), vim.inspect(ctx), vim.inspect(config)))
    local client_id = ctx.client_id
    if messages[client_id] == nil then
        -- bail if client did not opt into messaging support
        return
    end
    -- decode payload
    local token = result.token
    local kind = result.value['kind']
    local title = result.value['title']
    local message = result.value['message']
    local percentage = result.value['percentage']
    if kind == 'begin' then
        -- handle begin message
        messages[client_id].messages[token] = {
            complete = false,
            title = title,
            message = message,
            percentage = percentage,
            seq_no = 1,
        }
    elseif kind == 'report' then
        local msg_buf = messages[client_id].messages[token]
        if msg_buf  == nil then
            vim.notify(string.format('LSP PROGRESS: missing begin message for token %s in client %d',
                                     token, client_id))
            return
        end
        msg_buf.message = message
        msg_buf.percentage = percentage
        msg_buf.seq_no = msg_buf.seq_no + 1
    elseif kind == 'end' then
        local msg_buf = messages[client_id].messages[token]
        if msg_buf  == nil then
            vim.notify(string.format('LSP PROGRESS: missing begin message for token %s in client %d',
                                     token, client_id))
            return
        end
        msg_buf.message = ''
        msg_buf.percentage = 100
        msg_buf.complete = true
    end
end

function M.get_new_messages()
end

function M.register_client(client_id)
    messages[client_id] = {
        messages = {},
        completed = {},
    }
end

function M.register_lsp_progress()
    lsp_util.add_handler('$/progress', M.progress_handler)
end

return M
