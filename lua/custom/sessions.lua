local M = {}

local datadir = vim.fn.stdpath('data')

function M.restore_tabstop_info(session_info)
  vim.o.expandtab = session_info.tab_info.expandtab
  vim.o.tabstop = session_info.tab_info.tabstop
  vim.o.softtabstop = session_info.tab_info.softtabstop
  vim.o.shiftwidth = session_info.tab_info.shiftwidth
end

function M.restore_tabpages(session_info)
  local sess_buf_info = session_info.buf_info
  local current_buf_info = vim.fn.getbufinfo()
  for _, active_info in ipairs(current_buf_info) do
    for _, sess_info in ipairs(sess_buf_info) do
      if active_info.name == sess_info.name then
        vim.b[active_info.bufnr].tabpage = sess_info.variables.tabpage
      end
    end
	end
end

function M.info_to_be_stored_on_session()
  return {
    buf_info = vim.fn.getbufinfo(),
    tab_info = {
      expandtab = vim.o.expandtab,
      tabstop = vim.o.tabstop,
      softtabstop = vim.o.softtabstop,
      shiftwidth = vim.o.shiftwidth
    }
  }
end

function M.info_from_session(session_info)
  M.restore_tabstop_info(session_info)
  M.restore_tabpages(session_info)
end

function M.save_variables_to_file()
  local file_name = datadir .. '/shadas/' .. M.get_session_file_name() .. '.lua'
  local file = io.open(file_name, 'w')
  if file then
      file:write('vim.g.session_info = ' .. vim.inspect(M.info_to_be_stored_on_session()))
      file:close()
  else
      print("Error: Couldn't open file for writing " .. file_name)
  end
end

function M.load_variables_from_file()
  vim.cmd('source ' .. datadir .. '/shadas/' .. M.get_session_file_name() .. '.lua')
  M.info_from_session(vim.g.session_info)
end

function M.get_session_file_name()
  local pwd = vim.fn.getcwd()
  local file_name = pwd:gsub('/', '_')
  return file_name
end

function M.save_current_dir_session()
  vim.cmd('mksession! ' .. datadir .. '/sessions/' .. M.get_session_file_name() .. '.vim')
  M.save_variables_to_file()
end

function M.load_current_dir_session()
  vim.cmd('source ' .. datadir .. '/sessions/' .. M.get_session_file_name() .. '.vim')
  M.load_variables_from_file()
end

return M
