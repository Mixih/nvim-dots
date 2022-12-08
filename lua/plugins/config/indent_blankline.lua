local indent_blankline = require('indent_blankline')

indent_blankline.setup({
    filetype_exclude  = {
        'help',
        'make',
        'menhir',
        'ocaml',
        'ocamllex',
        'snippets',
        'tex',
    },
})
