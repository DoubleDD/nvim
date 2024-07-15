-- 使用空格代替 tab
vim.cmd("set expandtab")
-- 4个空格代替一个tab
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
-- 自动缩进4个空格
vim.cmd("set shiftwidth=4")
-- 和系统剪切板集成
vim.cmd("set clipboard=unnamed")
vim.cmd("set termguicolors")
-- 使用 空格 作为<leader>键
vim.g.mapleader = " "

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

