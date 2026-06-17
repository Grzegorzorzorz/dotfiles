require('overseer').setup({})

vim.keymap.set('n', '<leader>tt', ':OverseerRun<CR>')
vim.keymap.set('n', '<leader>tv', ':OverseerToggle<CR>')
