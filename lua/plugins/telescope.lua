return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set('n', '<leader>ff', require("telescope.builtin").find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fF', function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end, { desc = "Find All Files" })
      vim.keymap.set('n', '<leader>fw', require("telescope.builtin").live_grep, { desc = "Find Words" })
      vim.keymap.set('n', '<leader>fb', require("telescope.builtin").buffers, { desc = "Find Buffers" })
      vim.keymap.set('n', '<leader>fm', require("telescope.builtin").marks, { desc = "Find Marks" })
      vim.keymap.set('n', '<leader>fo', require("telescope.builtin").oldfiles, { desc = "Find Old Files" })
      vim.keymap.set('n', '<leader>fr', require("telescope.builtin").resume, { desc = "Find Resume" })
      vim.keymap.set('n', '<leader>fA', function() require("telescope").extensions.live_grep_args.live_grep_args() end
        ,{ desc = "Find Words with Args" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function ()
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function ()
      require("telescope").load_extension("live_grep_args")
    end
  },
  {
    "jackysee/telescope-hg.nvim",
    config = function ()
      require("telescope").load_extension("hg")
    end
  }
}
