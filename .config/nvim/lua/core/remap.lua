vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv;\'')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv;\'')

--vim.keymap.set('n', '<c-k>', '<cmd>wincmd k<cr>', silent)
--vim.keymap.set('n', '<c-j>', '<cmd>wincmd j<cr>', silent)
--vim.keymap.set('n', '<c-h>', '<cmd>wincmd h<cr>', silent)
--vim.keymap.set('n', '<c-l>', '<cmd>wincmd l<cr>', silent)
