return {
  'nvim-java/nvim-java',
  dependencies = {
    'nvim-java/lua-async-await',
    'nvim-java/nvim-java-core',
    'nvim-java/nvim-java-test',
    'nvim-java/nvim-java-dap',
    'MunifTanjim/nui.nvim',
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    {
      'williamboman/mason.nvim',
      opts = {
        registries = {
          'github:nvim-java/mason-registry',
          'github:mason-org/mason-registry',
        },
      },
    }
  },
  config = function()
    local function isJavaVersionAtLeast(version)
      local java_home = vim.fn.environ().JAVA_HOME
      if java_home ~= nil then
        local version_number = java_home:match('jdk.*jdk'):match('%d+')
        if version_number then
          version_number = tonumber(version_number)
          return version_number >= version
        end
      end
      return false
    end

    if isJavaVersionAtLeast(17) then
      require("java").setup({})
    end
  end
}
