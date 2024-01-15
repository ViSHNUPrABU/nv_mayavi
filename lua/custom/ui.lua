local M = {}

--- Set the indent and tab related numbers
function M.set_indent()
	local input_avail, input = pcall(vim.fn.input, "Set indent value (>0 expandtab, <=0 noexpandtab): ")
	if input_avail then
		local indent = tonumber(input)
		if not indent or indent == 0 then
			return
		end
		vim.bo.expandtab = (indent > 0) -- local to buffer
		indent = math.abs(indent)
		vim.bo.tabstop = indent -- local to buffer
		vim.bo.softtabstop = indent -- local to buffer
		vim.bo.shiftwidth = indent -- local to buffer
	end
end

--- Navigate left and right by n places in the bufferline
-- @param n number The number of tabs to navigate to (positive = right, negative = left)
function M.bufnav(n)
	local current_buf = vim.api.nvim_get_current_buf()
	local current_tab = vim.api.nvim_get_current_tabpage()
	local buf_info = vim.fn.getbufinfo()
	local bufs = {}

  for _, info in ipairs(buf_info) do
	  local term_pattern = "^term://.*;#toggleterm#"
    local non_term_condition = info.name:find(term_pattern) == nil
		if info.variables.tabpage == current_tab and non_term_condition == true then
			table.insert(bufs, info.bufnr)
		end
	end

  vim.t.bufs = bufs
	for i, v in ipairs(vim.t.bufs) do
		if current_buf == v then
			vim.cmd.b(vim.t.bufs[(i + n - 1) % #vim.t.bufs + 1])
			break
		end
	end
end

function M.close_all_buf_except_current()
	local current_tab = vim.api.nvim_get_current_tabpage()
	local current_buf = vim.api.nvim_get_current_buf()
  local buf_info = vim.fn.getbufinfo()
	for _, info in ipairs(buf_info) do
		if info.variables.tabpage == current_tab and info.bufnr ~= current_buf then
			vim.cmd("bdelete! " .. info.bufnr)
		end
	end
  vim.cmd.redrawtabline()
end

function M.close_current_buf()
	local current_buf = vim.api.nvim_get_current_buf()
  M.bufnav(vim.v.count > 0 and vim.v.count or 1)
  vim.cmd("bdelete! " .. current_buf)
end

return M
