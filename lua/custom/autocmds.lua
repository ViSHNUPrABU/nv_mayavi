-- Define the highlight_yank augroup
local highlight_yank = vim.api.nvim_create_augroup('highlight_yank', { clear = true })
local update_tabpage_group = vim.api.nvim_create_augroup("UpdateTabPageKey", { clear = true })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "Updating the current tabpage to bufinfo",
	group = update_tabpage_group,
	callback = function(args)
        if vim.b[args.buf].current_syntax ~= "qf" then
            vim.b[args.buf].tabpage = vim.api.nvim_get_current_tabpage()
        end
	end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     require("custom.sessions").load_current_dir_session()
--   end,
-- })

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    require("custom.sessions").save_current_dir_session()
  end,
})

-- Define the TextYankPost autocommand
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "To Highlight the yanked content",
  group = highlight_yank,
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
  end,
})

