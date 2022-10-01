local M = {}

-- automatically bootstrap and install packer
local packer_bootstrap = require('plugins.packer_bootstrap')

local packer = require('packer')

function M.load_plugins()
    return packer.startup(
        function (use)
            -- Use packer to manage itself
            use 'wbthomason/packer.nvim'

            -- libraries
            use 'nvim-lua/plenary.nvim'
            use 'vijaymarupudi/nvim-fzf'

            -- theme and appearance
            use 'feline-nvim/feline.nvim' -- statusline
            use 'kyazdani42/nvim-web-devicons'
            use 'lukas-reineke/indent-blankline.nvim'
            use 'navarasu/onedark.nvim'
            use {
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate'
            }
            use 'sheerun/vim-polyglot'

            -- completion
            use 'hrsh7th/cmp-nvim-lsp'
            use 'hrsh7th/cmp-buffer'
            use 'hrsh7th/cmp-nvim-lsp-signature-help'
            use 'hrsh7th/cmp-path'
            use 'hrsh7th/cmp-cmdline'
            use 'hrsh7th/nvim-cmp'
            use 'quangnguyen30192/cmp-nvim-ultisnips'

            -- utility plugins
            use 'junegunn/fzf'
            use 'junegunn/fzf.vim'
            use 'junegunn/vim-easy-align'
            use 'kyazdani42/nvim-tree.lua'
            use 'liuchengxu/vista.vim'
            use 'max397574/better-escape.nvim'
            use {
                'mg979/vim-visual-multi',
                branch = 'master'
            }
            use 'preservim/nerdcommenter'
            use {
                'puremourning/vimspector',
                run = './install_gadget.py --enable-c --enable-python'
            }
            use {
                'rrethy/vim-hexokinase',
                run = 'make hexokinase'
            }
            use 'SirVer/ultisnips'   -- snippets
            use 'tpope/vim-surround'
            use 'tweekmonster/startuptime.vim'
            use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
            use 'rcarriga/nvim-notify' -- pretty notifications
            use 'windwp/nvim-autopairs'

            -- LSP-based addons
            use 'neovim/nvim-lspconfig'
            use 'onsails/lspkind-nvim'
            use 'simrat39/symbols-outline.nvim'

            -- language plugins
            use 'lervag/vimtex'   -- tex
            use 'mattn/emmet-vim' -- html
            use 'Shirk/vim-gas'   -- gnu ASM

            -- version control
            use 'lewis6991/gitsigns.nvim'
            use 'tpope/vim-fugitive' -- git

          -- Automatically set up your configuration after cloning packer.nvim
          -- Put this at the end after all plugins
            if packer_bootstrap.fresh_install then
                packer.sync()
            end
        end
    )
end

return M
