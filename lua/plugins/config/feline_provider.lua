local navic = require('nvim-navic')

local M = {}

M.default_config = {
    code_context_enabled = {}
}

M.config = M.default_config

function M.code_context()
    local filetype = vim.bo.filetype
    if M.config.code_context_enabled[filetype] and navic.is_available() then
        return navic.get_location()
    end
    return ''
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
