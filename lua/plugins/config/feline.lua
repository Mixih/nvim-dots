local feline = require('feline')
local providers = require('plugins.config.feline_provider')
local vi_mode = require('feline.providers.vi_mode')

providers.setup({
    code_context_enabled ={
        'lua',
        'c',
        'cpp',
        'ocaml'
    }
})

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
    -- reset highlights
    {
        hl = {
            fg = 'NONE',
            bg = 'bg',
        },
    },
}

statusline_components.active[2] = {
    {
        hl = {
            fg = 'fg',
            bg = 'bg',
        },
    },
    {
        provider = providers.lsp_progress,
        right_sep = {
            str = ' |',
            hl = {
                fg = 'fg'
            },
        },
    },
    {
        provider = providers.lsp_name,
        right_sep = {
            str = ' |',
            hl = {
                fg = 'fg'
            },
        },
    },
    {
        provider = providers.file_encoding_fmt,
        right_sep = {
            str = ' |',
            hl = {
                fg = 'fg'
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
        icon = ' '
    },
    {
        provider = {
            name = 'position',
            opts = {
                --padding = {
                    --line = 2,
                    --col = 2,
                --},
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

statusline_components.inactive[1] = {
    {
        provider = 'file_info',
        hl = {
            fg = 'white',
            bg = 'bg',
            style = 'bold',
        },
        left_sep = {
            str = ' ',
            hl = {
                bg = 'bg',
            },
        },
        right_sep = {
            str = ' ',
            hl = {
                bg = 'bg',
            },
        },
        icon = '',
    },
    {
        hl = {
            fg = 'NONE',
            bg = 'bg',
        },
    },
}


local winbar_components = {
    active = {},
    inactive = {}
}

winbar_components.active[1] = {
    {
        provider = function()
            return providers.code_context()
        end
    }
}

feline.setup({
    theme = theme,
    components = statusline_components
})

feline.winbar.setup({
    components = winbar_components
})
