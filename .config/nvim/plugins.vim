call plug#begin()

Plug 'morhetz/gruvbox' " Gruvbox theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion for cpp
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'jackguo380/vim-lsp-cxx-highlight' " Additional syntax hl for cpp
Plug 'https://github.com/embear/vim-localvimrc' " Directory dependent configs
" Required by:
" - nvim-telescope/nvim/telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'mfussenegger/nvim-dap'
Plug 'andweeb/presence.nvim' " Discord RPC for nvim
" Required by:
" - romgrk/barbar.nvir
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'romgrk/barbar.nvim'
Plug 'jdhao/whitespace.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'lervag/vimtex'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
