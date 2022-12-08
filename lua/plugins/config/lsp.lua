local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require ('cmp_nvim_lsp')
local navic = require('nvim-navic')
local clangd_extensions = require('clangd_extensions')

local lsp_progress = require('plugins.lsp.lsp_progress')
local util = require('core.util')

-- aliases
local api = vim.api
local lsp = vim.lsp

-- set capabilities for lsps
local capabilities = cmp_nvim_lsp.default_capabilities(lsp.protocol.make_client_capabilities())

-- lsp buffer attach callback
local function on_attach_handler(client, bufnr)
    local hover_open = false
    -- keybinds for lsp buffers
    local keyopts = { buffer = bufnr }
    util.keymap('n', 'gD', lsp.buf.declaration, keyopts)
    util.keymap('n', 'gd', lsp.buf.definition, keyopts)
    util.keymap('n', 'gi', lsp.buf.implementation, keyopts)
    util.keymap('n', 'gr', lsp.buf.references, keyopts)
    util.keymap('n', 'K', function()
        hover_open = true
        vim.defer_fn(function()
            hover_open = false
        end, 5000)
        lsp.buf.hover()
    end, keyopts)
    util.keymap('n', '<leader><space>a', lsp.buf.code_action, keyopts)
    util.keymap('n', '<leader><space>f', lsp.buf.formatting, keyopts)
    util.keymap('n', '<leader><space>r', lsp.buf.rename, keyopts)
    util.keymap('n', '<leader><space>ds', lsp.buf.document_symbol, keyopts)
    util.keymap('n', '<leader><space>wa', lsp.buf.add_workspace_folder, keyopts)
    util.keymap('n', '<leader><space>wr', lsp.buf.remove_workspace_folder, keyopts)
    util.keymap('n', '<leader><space>wl', function()
        hover_open = true
        print(vim.inspect(lsp.buf.list_workspace_folders()))
    end, keyopts)

    -- show diagnostic automatically as pop-up
    util.define_buffer_autocmd({
        events = { 'CursorHold' },
        callback = function(event)
            if (not hover_open) then
                vim.diagnostic.open_float({ focusable = false })
            end
        end,
    })
    -- attach navic client (must occur after the autocommand)
    navic.attach(client, bufnr)
end

-- configure diagnostic symbols
local function lspSymbol(name, icon)
    vim.fn.sign_define(
        string.format('DiagnosticSign%s', name),
        { text = icon, texthl = string.format('DiagnosticSign%s', name) }
    )
end

lspSymbol('Error', '')
lspSymbol('Hint', '')
lspSymbol('Info', '')
lspSymbol('Warn', '')

-- set diagnostic format
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        -- virtual_text =  {
            -- spacing = 4,
        -- },
        virtual_text = false,
        signs = {
            priority = 10,
        },
        severity_sort = true,
    }
)

-- Only show most severe sign from diagnostic to preserve space on the signcolumn
local single_signs_ns = api.nvim_create_namespace('single_sign')
local orig_signs_handler = vim.diagnostic.handlers.signs
vim.diagnostic.handlers.signs = {
    -- override the show function to only display the most severe
    show = function(namespace, bufnr, diagnostics, opts)
        -- get all buffer diagnostics
        local buf_diagnostics = vim.diagnostic.get(bufnr)
        local max_sev_at_line = {}
        for _, def in pairs(buf_diagnostics) do
            local m_sev = max_sev_at_line[def.lnum]
            -- lower sev is more severe
            if not m_sev or def.severity < m_sev.severity then
                max_sev_at_line[def.lnum] = def
            end
        end
        local filtered = vim.tbl_values(max_sev_at_line)
        orig_signs_handler.show(single_signs_ns, bufnr, filtered, opts)
    end,
    hide = function(namespace, bufnr)
        orig_signs_handler.hide(single_signs_ns, bufnr)
    end
}

-- register progress message callback
lsp_progress.register_lsp_progress()

-- configure each lsp
clangd_extensions.setup {
    server = {
        capabilities = capabilities,
        on_attach = on_attach_handler,
        cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--header-insertion=iwyu'
        }
    },
    extensions = {
        autoSetHints = true,
        ast = {
            -- These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },
        },
    }
}

lspconfig.cmake.setup {
    capabilities = capabilities,
    on_attach = on_attach_handler,
}

lspconfig.jdtls.setup {
    capabilities = capabilities,
    on_attach = on_attach_handler,
}

lspconfig.pylsp.setup {
    capabilities = capabilities,
    on_attach = on_attach_handler,
}

lspconfig.ocamllsp.setup {
    capabilities = capabilities,
    on_attach = on_attach_handler,
}

lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach_handler,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
  },
}

lspconfig.texlab.setup {
    capabilities = capabilities,
    on_attach = on_attach_handler,
}
