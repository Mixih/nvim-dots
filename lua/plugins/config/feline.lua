local feline = require('feline')
local vi_mode = require('feline.providers.vi_mode')

local statusline_components = {
    active = {},
    inactive = {},
}

local theme = {
    bg = '#2c323d',
    black = '#1B1B1B',
    skyblue = '#62aeef',
    cyan = '#55b6c2',
    fg = '#D0D0D0',
    green = '#98c379',
    oceanblue = '#0066cc',
    magenta = '#C26BDB',
    orange = '#FF9000',
    red = '#e06b74',
    violet = '#9E93E8',
    white = '#FFFFFF',
    darkgrey = '#343d52',
    grey = '#3e4452',
    lightgrey = '#7e8ca8',
    yellow = '#E1E120',
}

statusline_components.active[1] = {
    {
        provider = {
            name = 'vi_mode',
        },
        hl = function()
            return {
                name = vi_mode.get_mode_highlight_name(),
                fg = 'black',
                bg = vi_mode.get_mode_color(),
                style = 'bold'
            }
        end,
        left_sep = {
            str = ' ',
            hl = function()
                return {
                    bg = vi_mode.get_mode_color(),
                }
            end,
        },
        right_sep = {
            str = ' ',
            hl = function()
                return {
                    bg = vi_mode.get_mode_color(),
                }
            end,
        },
        icon = '',
    },
    {
        provider = 'file_info',
        hl = {
            fg = 'white',
            bg = 'grey',
            style = 'bold',
        },
        left_sep = {
            str = ' ',
            hl = {
                bg = 'grey',
            },
        },
        right_sep = {
            str = ' ',
            hl = {
                bg = 'grey',
            },
        },
    },
    {
        provider = 'git_branch',
        right_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
            },
        },
        icon = '  ',
    },
    {
        provider = 'git_diff_added',
        hl = {
            fg = 'green',
        },
        icon = '  ',
    },
    {
        provider = 'git_diff_changed',
        hl = {
            fg = 'orange',
        },
        icon = '  ',
    },
    {
        provider = 'git_diff_removed',
        hl = {
            fg = 'red',
        },
        icon = '  ',
    },
    {
        hl = {
            fg = 'NONE',
            bg = 'bg',
        },
    },
}

statusline_components.active[2] = {
    {
        provider = 'file_format',
        left_sep = ' ',
        right_sep = {
            str = ' |',
            hl = {
                fg = 'fg',
            },
        },
    },
    {
        provider = 'file_encoding',
        left_sep = ' ',
        right_sep = {
            str = ' |',
            hl = {
                fg = 'fg',
            },
        },
    },
    {
        provider = {
            name = 'file_type',
            opts = {
                filetype_icon = false,
                case = 'lowercase'
            },
        },
        left_sep = ' ',
        right_sep = ' ',
    },
    {
        provider = 'line_percentage',
        hl = {
            bg = 'grey',
            style = 'bold',
        },
        left_sep = {
            str = ' ',
            hl = {
                bg = 'grey',
            },
        },
        right_sep = {
            str = ' ',
            hl = {
                bg = 'grey',
            },
        },
    },
    {
        provider = {
            name = 'position',
            opts = {
                padding = {
                    line = 3,
                    col = 3,
                },
                format = ' {line}:{col}',
            }
        },
        hl = {
            fg = 'black',
            bg = 'lightgrey',
            style = 'bold'
        },
        left_sep = {
            str = ' ',
            hl = {
                bg = 'lightgrey',
            },
        },
        right_sep = {
            str = ' ',
            hl = {
                bg = 'lightgrey',
            },
        },
    },
    {
        provider = 'diagnostic_errors',
        hl = { fg = 'red' },
    },
    {
        provider = 'diagnostic_warnings',
        hl = { fg = 'yellow' },
    },
    {
        provider = 'diagnostic_hints',
        hl = { fg = 'cyan' },
    },
    {
        provider = 'diagnostic_info',
        hl = { fg = 'skyblue' },
    },
}

feline.setup({
    theme = theme,
    components = statusline_components
})
--feline.winbar.setup()
