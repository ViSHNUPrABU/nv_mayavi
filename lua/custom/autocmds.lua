local update_tabpage_group = vim.api.nvim_create_augroup("UpdateTabPageKey", { clear = true })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "Updating the current tabpage to bufinfo",
	group = update_tabpage_group,
	callback = function(args)
		vim.b[args.buf].tabpage = vim.api.nvim_get_current_tabpage()
	end,
})
