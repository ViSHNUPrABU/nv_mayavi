vim.o.number = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.colorcolumn = '100'
vim.g.mapleader = " "

vim.keymap.set('n', '<A-e>', "e", { desc = "Refresh current buffer" })

vim.keymap.set('n', '<A-f>', "10j", { desc = "Move down 10 lines" })
vim.keymap.set('n', '<A-b>', "10k", { desc = "Move up 10 lines" })

vim.keymap.set('n', '<leader>a', "gg0VG$", { desc = "Select All" })

vim.keymap.set('n', '<leader>w', "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set('n', '<leader>W', "<cmd>wall<cr>", { desc = "Save" })
vim.keymap.set('n', '<leader>x', "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set('n', '<leader>X', function() require("custom.ui").close_current_buf_and_window() end, { desc = "Close current buffer and window" })
vim.keymap.set('n', '<leader>c', function() require("custom.ui").close_current_buf() end, { desc = "Close Buffer" })
vim.keymap.set('n', '<leader>C', function() require("custom.ui").close_all_buf_except_current() end, { desc = "Close all buffer except current" })

vim.keymap.set('n', '<leader>df', function() vim.wo.foldenable = false end, { desc = "Disable Fold For Window" })
vim.keymap.set('n', '<leader>dw', function() vim.wo.wrap = true end, { desc = "Enable Wrap For Window" })

vim.keymap.set('n', '<leader>db', "<cmd>DBUIToggle<cr>", { desc = "Toggle Dadbod UI" })
vim.keymap.set({'n','t'}, '<F7>', "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" })

vim.keymap.set('n', '<C-h>', "<C-w>h", { desc = "Move to left split" })
vim.keymap.set('n', '<C-j>', "<C-w>j", { desc = "Move to below split" })
vim.keymap.set('n', '<C-k>', "<C-w>k", { desc = "Move to above split" })
vim.keymap.set('n', '<C-l>', "<C-w>l", { desc = "Move to right split" })

vim.keymap.set('n', '<A-Up>', "<cmd>resize -4<CR>", { desc = "Resize split up" })
vim.keymap.set('n', '<A-Down>', "<cmd>resize +4<CR>", { desc = "Resize split down" })
vim.keymap.set('n', '<A-Left>', "<cmd>vertical resize -4<CR>", { desc = "Resize split left" })
vim.keymap.set('n', '<A-Right>', "<cmd>vertical resize +4<CR>", { desc = "Resize split right" })

vim.keymap.set('n', '<leader>ss', function() require("custom.sessions").save_current_dir_session() end, { desc = "Save Current Session" })
vim.keymap.set('n', '<leader>sl', function() require("custom.sessions").load_current_dir_session() end, { desc = "Load Current Session" })

vim.keymap.set('n', '<leader>wv', "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set('n', '<leader>wh', "<cmd>split<cr>", { desc = "Horizontal Split" })

vim.keymap.set('n', '<A-t>', "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set('n', '<A-T>', "<cmd>tabprevious<cr>", { desc = "Previous tab" })
vim.keymap.set('n', '<leader>tn', "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set('n', '<leader>tc', "<cmd>tabclose<cr>", { desc = "Close tab" })

vim.keymap.set('n', '<A-o>', "<cmd>copen<cr>", { desc = "Open QuickFix List" })
vim.keymap.set('n', '<A-O>', function() require("custom.git-diff").open_quickfix_in_new_tab() end, { desc = "Open QuickFix List in New Tab" })
vim.keymap.set('n', '<A-p>', function() require("custom.git-diff").prev_quickfix_entry() end, { desc = "Move to Previous QuickFix List" })
vim.keymap.set('n', '<A-n>', function() require("custom.git-diff").next_quickfix_entry() end, { desc = "Move to Next QuickFix List" })
vim.keymap.set('n', '<A-h>', function() require("custom.git-diff").view_git_history() end, { desc = "View Git History" })
vim.keymap.set('n', '<A-c>', function() require("custom.git-diff").close_quickfix_window() end, { desc = "Close QuickFix List" })
vim.keymap.set('n', '<A-C>', function() require("custom.git-diff").close_quickfix_window_and_tab() end, { desc = "Close QuickFix List and Current Tab" })

vim.keymap.set('n', '<leader>ui', function() require("custom.ui").set_indent() end, { desc = "Change indent setting" })
vim.keymap.set('n', '<leader>ut', "<cmd>UndotreeToggle<cr>", { desc = "UndoTree Toggle" })
vim.keymap.set('n', '<leader>uw', "gqap", { desc = "Enable TextWidth wrap" })

vim.keymap.set('n', '<Tab>', function() require("custom.ui").bufnav(vim.v.count > 0 and vim.v.count or 1) end, { desc = "Next buffer" })
vim.keymap.set('n', '<S-Tab>', function() require("custom.ui").bufnav(-(vim.v.count > 0 and vim.v.count or 1)) end, { desc = "Previous buffer" })
vim.keymap.set('t', '<F8>', function() require("custom.ui").bufnav(vim.v.count > 0 and vim.v.count or 1) end, { desc = "Next buffer" })
