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
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
    opts = { use_default_keymaps = false },
    config = function()
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
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
              return "("..count..")"
          end,
          custom_filter = function(buf, buf_nums)
            local current_tab = vim.api.nvim_get_current_tabpage()
            local buf_info = vim.fn.getbufinfo(buf)
            for _, info in ipairs(buf_info) do
                if info.variables.tabpage == current_tab then
                    return true
                end
            end
            return false
          end,
          show_tab_indicators = true,
        }
      })
    end
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
