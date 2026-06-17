vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv;\'')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv;\'')

vim.keymap.set('n', '<leader>bc', ':bd<CR>')
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>')
