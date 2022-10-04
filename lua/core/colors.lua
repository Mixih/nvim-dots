-- Unified color configurations
local M = {}

-- onedark colors
M.onedark_diag_colors = {
    white  = "#ffffff",
    red    = "#e86671",
    yellow = "#e5c07b",
    teal   = "#56b6c2",
    purple = "#c678dd",
}

M.onedark_icon_colors = {
    ltblue = '#61afef',
    orange = '#d19a66',
    yellow = '#e5c07b',
    teal   = '#56b6c2',
    purple = '#c678dd',
    green  = '#98c379',
    red    = '#e86671',
}

-- onedark darker profile colors
M.onedarker_diag_colors = {
    white  = "#ffffff",
    red    = '#e55561',
    yellow = '#e2b86b',
    teal   = '#48b0bd',
    purple = '#bf68d9',
}

M.onedarker_icon_colors = {
    ltblue = '#4fa6ed',
    orange = '#cc9057',
    yellow = '#e2b86b',
    teal   = '#48b0bd',
    purple = '#bf68d9',
    green  = '#8ebd6b',
    red    = '#e55561',
}

-- select current set of colors
M.diag = M.onedarker_diag_colors
M.icon = M.onedarker_icon_colors

return M
