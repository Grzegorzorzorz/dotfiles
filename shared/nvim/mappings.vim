let mapleader = ";"

nnoremap <leader>rr :source $MYVIMRC<CR>

nnoremap <leader>n :set nu! rnu!<CR>
nnoremap <leader>h :nohl<CR>

" git bindings
nnoremap <leader>gl :Gitsigns toggle_current_line_blame<CR>
nnoremap <leader>gd :Gitsigns diffthis<CR>

nnoremap <silent> <leader>v :Explore<CR>

" Find
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Buffer
nnoremap <leader>bn :enew<CR>
nnoremap <leader>bv :vnew<CR>
nnoremap <leader>bh :new<CR>
nnoremap <leader>bc :bd<CR>
nnoremap <leader>bw :w<CR>
nnoremap <leader>bs :w<CR>:bd<CR>
nnoremap <leader>bf <cmd>Telescope buffers<CR>

" Remove arrow key crutch
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
