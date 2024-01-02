return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local harpoon = require("harpoon")
    local conf = require("telescope.config").values

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      }
    })

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
              results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
      }):find()
    end

    local function select_harpoon_item()
      local input_avail, input = pcall(vim.fn.input, "Select Harpoon Item: ")
      if input_avail then
        local indent = tonumber(input)
        if not indent or indent == 0 then return end
        indent = math.abs(indent)
        harpoon:list():select(indent)
      end
    end

    vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Add Harpoon" })
    vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Previous Harpoon Item" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Next Harpoon Item" })
    vim.keymap.set("n", "<leader>hs", function() select_harpoon_item() end, { desc = "Select Harpoon Item" })
  end,
}
