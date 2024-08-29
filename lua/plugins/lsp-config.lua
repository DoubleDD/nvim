return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            format = {
              enable = true,
            },
          },
        },
      })
      lspconfig.gopls.setup({
        settings = {
          golps = {
            ui = {
              completion = {
                usePlaceholders = true,
              },
            },
          },
        },
      })
      lspconfig.angularls.setup({
        -- 可以添加更多设置，比如 on_attach、capabilities 等等
        -- capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        },
      })
    end,
  },
}
