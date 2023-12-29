return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set('n', '<leader>ff', require("telescope.builtin").find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fw', require("telescope.builtin").live_grep, { desc = "Find Words" })
      vim.keymap.set('n', '<leader>fb', require("telescope.builtin").buffers, { desc = "Find Buffers" })
      vim.keymap.set('n', '<leader>fm', require("telescope.builtin").marks, { desc = "Find Marks" })
      vim.keymap.set('n', '<leader>fo', require("telescope.builtin").oldfiles, { desc = "Find Old Files" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
