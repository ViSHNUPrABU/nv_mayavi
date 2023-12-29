return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.angularls.setup({})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Declaration of current symbol" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Declaration of current symbol" })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Implementation of current symbol" })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "References of current symbol" })
      vim.keymap.set('n', '<leader>lH', vim.lsp.buf.signature_help, { desc = "Signature help" })
      vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { desc = "Hover symbol details" })
      vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, { desc = "Definition of current type" })
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename current symbol" })
      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = "LSP code action" })
      vim.keymap.set('n', '<leader>lf', function()
        vim.lsp.buf.format { async = true }
      end, { desc = "Format buffer" })
    end,
  }
}
