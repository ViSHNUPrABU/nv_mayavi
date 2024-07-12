return {
  {
    "tpope/vim-fugitive",
    config = function ()
      vim.keymap.set('n', '<leader>gg', '<cmd>Git! | wincmd H | vertical resize 100<cr>', { desc = "Vim Fugitive" } )
      vim.keymap.set('n', '<leader>gv', '<cmd>Gvdiffsplit!<cr>', { desc = "View Vertical Three way diff split" })
      vim.keymap.set('n', '<leader>gx', function() vim.cmd("Git!") vim.cmd("q") end, { desc = "Close Vim Fugitive Window" })
    end
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function ()
      vim.keymap.set('n', "<leader>Gl", function() require("telescope").extensions.git_worktree.git_worktrees() end, { desc = "Git Worktree list" })
      vim.keymap.set('n', "<leader>Gc", function() require("telescope").extensions.git_worktree.create_git_worktree() end, { desc = "Create Git Worktree" })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "▎" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ "n", "v" }, "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to next hunk" })

        map({ "n", "v" }, "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to previous hunk" })

        -- Actions
        -- visual mode
        map("v", "<leader>gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage git hunk" })
        map("v", "<leader>gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset git hunk" })
        -- normal mode
        map("n", "<leader>gs", gs.stage_hunk, { desc = "Git stage hunk" })
        map("n", "<leader>gr", gs.reset_hunk, { desc = "Git reset hunk" })
        map("n", "<leader>gS", gs.stage_buffer, { desc = "Git Stage buffer" })
        map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map("n", "<leader>gR", gs.reset_buffer, { desc = "Git Reset buffer" })
        map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview git hunk" })
        map("n", "<leader>gb", function() gs.blame_line({ full = false }) end, { desc = "Git blame line" })
        -- map("n", "<leader>gd", gs.diffthis, { desc = "Git diff against index" })
        map("n", "<leader>gD", function()
          gs.diffthis("~")
        end, { desc = "Git diff against last commit" })

        -- Toggles
        -- map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle git blame line" })
        map("n", "<leader>gd", gs.toggle_deleted, { desc = "Toggle git show deleted" })

        map("n", '<leader>gt', require("telescope.builtin").git_status, { desc = "Git status list" })
        map("n", '<leader>gc', require("telescope.builtin").git_commits, { desc = "Git Commits list" })
        map("n", '<leader>gB', require("telescope.builtin").git_branches, { desc = "Git Branches list" })
        map("n", '<leader>gl', require("telescope.builtin").git_stash, { desc = "Git Stash list" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select git hunk" })
      end,
    },
  }
}
