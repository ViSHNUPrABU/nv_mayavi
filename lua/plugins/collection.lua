return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      local startify = require'alpha.themes.startify'.config
      startify.layout[2].val = {
          [[                                      __                 ]],
          [[     ___      ___     ___    __   __ /\_\     ___ ___    ]],
          [[    / _ `\   / __`\  / __`\ /\ \ /\ \\/\ \   / __` __`\  ]],
          [[   /\ \/\ \ /\  __/ /\ \_\ \\ \ \_/ / \ \ \ /\ \/\ \/\ \ ]],
          [[   \ \_\ \_\\ \____\\ \____/ \ \___/   \ \_\\ \_\ \_\ \_\]],
          [[    \/_/\/_/ \/____/ \/___/   \/__/     \/_/ \/_/\/_/\/_/]],
      }
      require'alpha'.setup(startify)
    end
  };
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    'stevearc/resession.nvim',
    opts = {},
    config = function ()
      local resession = require('resession')
      resession.setup()

      local load_cur_dir_sess = function()
        if vim.fn.argc(-1) == 0 then
          resession.load(vim.fn.getcwd(), { silence_errors = true })
        end
      end

      vim.keymap.set('n', "<leader>Sl", function() resession.load "Last Session" end, { desc = "Load last session" })
      vim.keymap.set('n', "<leader>Ss", function() resession.save() end, { desc = "Save this session" })
      vim.keymap.set('n', "<leader>Sd", function() resession.delete() end, { desc = "Delete a session" })
      vim.keymap.set('n', "<leader>Sf", function() resession.load() end, { desc = "Load a session" })
      vim.keymap.set('n', "<leader>S.", load_cur_dir_sess, { desc = "Load current directory session" })
      vim.keymap.set('n', '<leader>Sd', resession.delete)

      -- vim.api.nvim_create_autocmd("VimEnter", {
      --   callback = load_cur_dir_sess
      -- })
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          resession.save(vim.fn.getcwd(), {notify = false })
        end,
      })
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
      })
    end,
  },
  {
    'ViSHNUPrABU/vim-dadbod-ui',
    dependencies = {
      { 'ViSHNUPrABU/vim-dadbod', lazy = true },
      { 'ViSHNUPrABU/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      open_mapping = [[<F7>]],
      shading_factor = 2,
      float_opts = { border = "rounded" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    opts = function()
      local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
          },
        },
      })
      vim.keymap.set(
        "n",
        "<leader>n",
        "<cmd>Neotree filesystem reveal left toggle<cr>",
        { desc = "NeoTree Toggle" }
      )
    end,
  },
}
