local M = {}

function M.view_git_history()
  vim.fn.system("Git difftool --name-only -- !^@")
  M.diff_current_quickfix_entry()
  -- Bind <CR> for the current quickfix window to properly set up diff split layout after selecting an item
  -- There's probably a better way to map this without changing the window
  vim.cmd("copen")
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<CR>",
    "<CR><BAR>:lua require('custom.git-diff').diff_current_quickfix_entry()<CR>",
    { noremap = true, silent = true }
  )
  vim.cmd("wincmd p")
end

function M.diff_current_quickfix_entry()
  -- Cleanup windows
  for _, window in ipairs(vim.fn.getwininfo()) do
    if
        window.winnr ~= vim.fn.winnr()
        and vim.fn.bufname(window.bufnr) ~= nil
        and vim.fn.match(vim.fn.bufname(window.bufnr), "^fugitive:") ~= -1
    then
      vim.cmd("bdelete " .. window.bufnr)
    end
  end

  vim.cmd("cc")
  local qf = vim.fn.getqflist({ context = 0, idx = 0 })
  if qf.idx and type(qf.context) == "table" and type(qf.context.items) == "table" then
    local diff = qf.context.items[qf.idx].diff or {}
    vim.api.nvim_echo({ { table.concat(vim.fn.reverse(vim.fn.range(#diff)), ", "), "Normal" } }, false, {})
    for i = #diff, 1, -1 do
      vim.cmd(
        (i > 1 and "leftabove" or "rightbelow") .. " vert diffsplit " .. vim.fn.fnameescape(diff[i].filename)
      )
    end
  end
end

function M.open_quickfix_in_new_tab()
  vim.cmd("cclose")
  vim.cmd("tabnew")
  vim.cmd("copen")
  vim.cmd("cfirst")
end

function M.prev_quickfix_entry()
  vim.cmd("cprev")
  vim.cmd("copen")
  vim.cmd("wincmd p")
end

function M.next_quickfix_entry()
  vim.cmd("cnext")
  vim.cmd("copen")
  vim.cmd("wincmd p")
end

function M.close_quickfix_window()
  vim.cmd("copen")
  require("custom.ui").close_current_buf()
  -- vim.cmd("confirm q")
end

function M.close_quickfix_window_and_tab()
  vim.cmd("copen")
  require("custom.ui").close_current_buf()
  vim.cmd("confirm q")
end

return M
