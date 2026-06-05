require('overseer').setup({})

vim.keymap.set('n', '<leader>tr', ':OverseerRun<CR>')
vim.keymap.set('n', '<leader>tt', ':OverseerToggle<CR>')
