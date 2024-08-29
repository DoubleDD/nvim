return {
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    dependencies = { -- optional packages
      "neovim/nvim-lspconfig",
    },
    config = function()

      local ts_utils = require("nvim-lsp-ts-utils")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- tsserver 设置
      require("lspconfig").tsserver.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- ts-utils 配置
          ts_utils.setup({
            -- eslint_bin = "eslint_d",
            -- eslint_enable_diagnostics = true,
            -- eslint_enable_code_actions = true,
            -- enable_formatting = true,
            -- formatter = "prettier",
          })
          ts_utils.setup_client(client)

          vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", { silent = true })
        end,
      })
      -- 自动保存时格式化代码和优化导入
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.ts",
        callback = function()
          -- 格式化代码
          vim.lsp.buf.format({ async = false })

          -- 自动优化导入
          vim.cmd("TSLspImportAll")
          vim.cmd("TSLspOrganize")
        end,
      })
    end,
  },
}
