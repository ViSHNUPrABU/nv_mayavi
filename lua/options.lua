vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.g.mapleader = " "

vim.keymap.set('n', '<A-f>', "10j", { desc = "Move down 10 lines" })
vim.keymap.set('n', '<A-b>', "10k", { desc = "Move up 10 lines" })

vim.keymap.set('n', '<leader>w', "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set('n', '<leader>W', "<cmd>wall<cr>", { desc = "Save" })
vim.keymap.set('n', '<leader>x', "<cmd>confirm q<cr>", { desc = "Quit" })
vim.keymap.set('n', '<leader>X', "<cmd>confirm qall<cr>", { desc = "Quit All" })
-- vim.keymap.set('n', '<leader>c', "<cmd>bdelete! %d<cr>", { desc = "Close Buffer" })
vim.keymap.set('n', '<leader>c', function() require("custom.ui").close_current_buf() end, { desc = "Close Buffer" })
vim.keymap.set('n', '<leader>C', function() require("custom.ui").close_all_buf_except_current() end, { desc = "Close all buffer except current" })

vim.keymap.set('n', '<leader>db', "<cmd>DBUIToggle<cr>", { desc = "Toggle Dadbod UI" })
vim.keymap.set('n', '<F7>', "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" })

vim.keymap.set('n', '<C-h>', "<C-w>h", { desc = "Move to left split" })
vim.keymap.set('n', '<C-j>', "<C-w>j", { desc = "Move to below split" })
vim.keymap.set('n', '<C-k>', "<C-w>k", { desc = "Move to above split" })
vim.keymap.set('n', '<C-l>', "<C-w>l", { desc = "Move to right split" })

vim.keymap.set('n', '<C-Up>', "<cmd>resize -1<CR>", { desc = "Resize split up" })
vim.keymap.set('n', '<C-Down>', "<cmd>resize +1<CR>", { desc = "Resize split down" })
vim.keymap.set('n', '<C-Left>', "<cmd>vertical resize -1<CR>", { desc = "Resize split left" })
vim.keymap.set('n', '<C-Right>', "<cmd>vertical resize +1<CR>", { desc = "Resize split right" })

vim.keymap.set('n', '<leader>wv', "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set('n', '<leader>ws', "<cmd>split<cr>", { desc = "Horizontal Split" })

vim.keymap.set('n', '<leader>tl', "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set('n', '<leader>th', "<cmd>tabprevious<cr>", { desc = "Previous tab" })
vim.keymap.set('n', '<leader>tn', "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set('n', '<leader>tc', "<cmd>tabclose<cr>", { desc = "Close tab" })

vim.keymap.set('n', '<leader>qp', function() require("custom.git-diff").prev_quickfix_entry() end, { desc = "Move to Previous QuickFix List" })
vim.keymap.set('n', '<leader>qn', function() require("custom.git-diff").next_quickfix_entry() end, { desc = "Move to Next QuickFix List" })
vim.keymap.set('n', '<leader>qh', function() require("custom.git-diff").view_git_history() end, { desc = "View Git History" })

vim.keymap.set('n', '<leader>ui', function() require("custom.ui").set_indent() end, { desc = "Change indent setting" })
vim.keymap.set('n', '<leader>ut', "<cmd>UndotreeToggle<cr>", { desc = "UndoTree Toggle" })

vim.keymap.set('n', '<Tab>', function() require("custom.ui").bufnav(vim.v.count > 0 and vim.v.count or 1) end, { desc = "Next buffer" })
vim.keymap.set('n', '<S-Tab>', function() require("custom.ui").bufnav(-(vim.v.count > 0 and vim.v.count or 1)) end, { desc = "Previous buffer" })
