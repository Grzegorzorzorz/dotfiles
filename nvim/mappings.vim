let mapleader = ";"

nnoremap <leader>rr :source $MYVIMRC<CR>

nnoremap <leader>n :set invnumber<CR>
nnoremap <leader>h :nohl<CR>

nnoremap <leader>bs :BufferOrderByLanguage<CR>

" git bindings
nnoremap <leader>gl :Gitsigns toggle_current_line_blame<CR>
nnoremap <leader>gd :Gitsigns diffthis<CR>

nnoremap <F8> :TagbarToggle<CR>

nnoremap <silent> <C-f> :CHADopen --always-focus<CR>
nnoremap <silent> <C-b> :CHADopen<CR>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

nnoremap <silent> <A-,> :BufferPrevious<CR>
nnoremap <silent> <A-.> :BufferNext<CR>
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
nnoremap <silent> <A->> :BufferMoveNext<CR>
nnoremap <silent> <A-c> :BufferClose<CR>

" Remove arrow key crutch
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
