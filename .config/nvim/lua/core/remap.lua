vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv;'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv;'")

--nmap <silent> <c-k> :wincmd k<CR>
--nmap <silent> <c-j> :wincmd j<CR>
--nmap <silent> <c-h> :wincmd h<CR>
--nmap <silent> <c-l> :wincmd l<CR>

vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>", silent)
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>", silent)
vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>", silent)
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>", silent)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<Leader>da", "<CMD>lua require('dap').continue()<CR>", silent)
vim.keymap.set("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", silent)
vim.keymap.set("n", "<Leader>dc", "<CMD>lua require('dap').continue()<CR>", silent)
vim.keymap.set("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>", silent)
vim.keymap.set("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", silent)
vim.keymap.set("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", silent)
vim.keymap.set("n", "<Leader>dd", "<CMD>lua require('dap').step_over()<CR>", silent)
vim.keymap.set("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", silent)
vim.keymap.set("n", "<Leader>du", "<CMD>lua require('dapui').toggle()<CR>", silent)
