local navic = require('nvim-navic')

local M = {}

M.default_config = {
    code_context_enabled = {}
}

M.config = M.default_config

-- a component that provides the current location info within LSP files
function M.code_context()
    local filetype = vim.bo.filetype
    if M.config.code_context_enabled[filetype] and navic.is_available() then
        return navic.get_location()
    end
    return ''
end

-- a component that renders the current lsp progress messages
function M.lsp_progress(component)
    local lsp_progress = vim.lsp.util.get_progress_messages()[1]
    if not lsp_progress then
        return ''
    elseif lsp_progress then
        local msg = lsp_progress.message or ''
        local title = lsp_progress.title or ''
        local percentage = lsp_progress.percentage
        local spinners = { '  ', '  ', '  ' }
        local ms = vim.loop.hrtime() / 1000000
        local frame = (math.floor(ms / 100) % #spinners) + 1
        if component.icon ~= '' then
            component.icon = spinners[frame]
        end
        return string.format('%s %s (%s%%%%)', title, msg, percentage)
    end
end

-- a component that displays the name of the language server currently attached to a
-- buffer
function M.lsp_name(component)
    local icons = {
        ready = '  ',
        waiting = '  ',
        stopped = '  ',
    }
    local language_clients = vim.lsp.get_active_clients({
        bufnr = 0
    })
    if not language_clients or vim.fn.winwidth(0) < 100 then
        return ''
    end
    local primary = language_clients[1]
    if not primary then
        return ''
    end
    if component.icon ~= '' then
        if vim.lsp.client_is_stopped(primary.id) then
            component.icon = icons.stopped
        else
            component.icon = icons.ready
            -- component.icon = icons.waiting
        end
    end
    return '' .. primary.name
end

-- A component that disp,ays the file format as an icon, and the encoding as text
function M.file_encoding_fmt(component)
    local os_icons = {
        unix = '  ',
        dos = '  ',
        mac = '  ',
    }
    local encoding = ((vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc)
    local format = ((vim.bo.fileformat ~= '' and vim.bo.fileformat) or vim.o.fileformat)
    if component.icon ~= '' then
        component.icon = os_icons[format]
    end
    return encoding
end

function M.setup(config)
    if config ~= nil then
        M.config = config
    end
    local code_context_ena_set = {}
    for _, ft in ipairs(M.config.code_context_enabled) do
        code_context_ena_set[ft] = true
    end
    M.config.code_context_enabled = code_context_ena_set
end

return M
