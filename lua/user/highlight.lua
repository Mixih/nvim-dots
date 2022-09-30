local colors = require('core.colors')

local api = vim.api

-- Diagnostic errors should be rendered as squiggles
api.nvim_set_hl(0, "DiagnosticUnderlineError",
    { cterm={ underline=true }, undercurl=true, sp=colors.red })
api.nvim_set_hl(0, "DiagnosticUnderlineWarn",
    { cterm={ underline=true }, undercurl=true, sp=colors.yellow })
api.nvim_set_hl(0, "DiagnosticUnderlineInfo",
    { cterm={ underline=true }, undercurl=true, sp=colors.ltblue })
api.nvim_set_hl(0, "DiagnosticUnderlineHint",
    { cterm={ underline=true }, undercurl=true, sp=colors.purple })

-- Spellcheck errors should be squiggles
api.nvim_set_hl(0, 'SpellBad',
    { cterm={ underline=true }, undercurl=true, sp=colors.red})
api.nvim_set_hl(0, 'SpellCap',
    { cterm={ underline=true }, undercurl=true, sp=colors.yellow})
