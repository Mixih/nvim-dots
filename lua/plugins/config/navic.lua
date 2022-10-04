local navic = require('nvim-navic')
local colors = require('core.colors')

local dcolors = colors.diag
local icolors = colors.icon

navic.setup({
    highlight = true,
})

-- configure icon colors
vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, fg = icolors.ltblue})
vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, fg = icolors.orange})
vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, fg = icolors.ltblue})
vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, fg = icolors.teal})
vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, fg = icolors.yellow})
vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, fg = icolors.ltblue})
vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, fg = icolors.teal})
vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, fg = icolors.purple})
vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, fg = icolors.ltblue})
vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, fg = icolors.purple})
vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, fg = icolors.green})
vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, fg = icolors.ltblue})
vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, fg = icolors.purple})
vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, fg = icolors.orange})
vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, fg = icolors.green})
vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, fg = icolors.orange})
vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, fg = icolors.orange})
vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, fg = icolors.orange})
vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, fg = icolors.orange})
vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, fg = icolors.teal})
vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, fg = icolors.orange})
vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, fg = icolors.yellow})
vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, fg = icolors.purple})
vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, fg = icolors.yellow})
vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, fg = icolors.red})
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, fg = icolors.red})
vim.api.nvim_set_hl(0, "NavicText",               {default = true, fg = dcolors.white})
vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, fg = dcolors.white})
