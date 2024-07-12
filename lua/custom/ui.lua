local M = {}

--- Set the indent and tab related numbers
function M.set_indent()
  local input_avail, input = pcall(vim.fn.input, "Set indent value (>0 expandtab, <=0 noexpandtab): ")
  if input_avail then
    local indent = tonumber(input)
    if not indent or indent == 0 then
      return
    end
    vim.o.expandtab = (indent > 0) -- local to buffer
    indent = math.abs(indent)
    vim.o.tabstop = indent       -- local to buffer
    vim.o.softtabstop = indent   -- local to buffer
    vim.o.shiftwidth = indent    -- local to buffer
  end
end

--- Navigate left and right by n places in the bufferline
-- @param n number The number of tabs to navigate to (positive = right, negative = left)
function M.bufnav(n)
  local current_buf = vim.api.nvim_get_current_buf()
  local current_tab = vim.api.nvim_get_current_tabpage()
  local buf_info = vim.fn.getbufinfo()
  local bufs = {}

  local term_pattern = "^term://.*;#toggleterm#"
  local neo_tree_pattern = "neo.*tree.*filesystem"
  local dbui_pattern = vim.fn.getcwd() .. "/dbui"
  local dbout_pattern = ".*dbout"

  local file = io.open("/Users/vishnu-17366/Documents/logs/temp.log", "a")
  if file then
    file:write(vim.inspect(dbui_pattern))
    file:write(vim.inspect(bufs))

  for _, info in ipairs(buf_info) do
    file:write(vim.inspect(info))
    local no_nav_condition = info.name and
        (info.name:find(term_pattern) == nil) and (info.name:find(neo_tree_pattern) == nil)
        and (info.name ~= dbui_pattern) and (info.name:find(dbout_pattern) == nil)
    if info.variables.tabpage == current_tab and info.name ~= "" and no_nav_condition == true then
      table.insert(bufs, info.bufnr)
    end
  end

    file:write(vim.inspect(bufs))
    file:close()
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

  local term_pattern = "^term://.*;#toggleterm#"

  for _, info in ipairs(buf_info) do
    local non_term_condition = info.name and info.name:find(term_pattern) == nil
    if info.variables.tabpage == current_tab and info.bufnr ~= current_buf and non_term_condition == true then
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

function M.close_current_buf_and_window()
  local current_buf = vim.api.nvim_get_current_buf()
  M.bufnav(vim.v.count > 0 and vim.v.count or 1)
  vim.cmd("bdelete! " .. current_buf)
  vim.cmd("q")
end

return M
