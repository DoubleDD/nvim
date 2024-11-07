return {
  -- Prettier.nvim 插件
  {
    "MunifTanjim/prettier.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("prettier").setup({
        bin = "prettier", -- 可以是 `prettierd`（Prettier 守护进程），提升格式化速度
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "css",
          "scss",
          "html",
          "json",
          "yaml",
          "markdown",
        },
        cli_options = {
          config_precedence = "prefer-file", -- 优先使用项目中的 .prettierrc 文件
        },
      })
    end,
  },
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    dependencies = { -- optional packages
      "neovim/nvim-lspconfig",
    },
    config = function()
      local ts_utils = require("nvim-lsp-ts-utils")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- tsserver 设置
      require("lspconfig").ts_ls.setup({
        filetypes = { "javascript","javascript.jsx","typescript", "typescriptreact", "typescript.tsx" },
        capabilities = capabilities,
        -- cmd = { "typescript-language-server", "--stdio" },
        on_attach = function(client, bufnr)
          -- 禁用 LSP 自带的格式化，避免和 Prettier 冲突
          client.server_capabilities.documentFormattingProvider = false

          -- ts-utils 配置
          ts_utils.setup({
            enable_import_on_completion = true,
            eslint_enable_diagnostics = true,
            update_imports_on_move = true,
            require_confirmation_on_move = false,
            formatter = "prettier", -- 使用 Prettier 格式化
            eslint_bin = "eslint_d", -- 使用 eslint_d 提高性能
            eslint_enable_code_actions = true,
            complete_parens = true,
          })
          ts_utils.setup_client(client)

          vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", { silent = true })
          vim.api.nvim_buf_set_keymap(bufnr, "n", "go", ":TSLspOrganize<CR>:TSLspImportAll<CR>", { silent = true })
        end,
      })

      -- 自动保存时格式化代码和优化导入
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.ts", "*.tsx" },
        callback = function()
          -- 格式化代码
          vim.lsp.buf.format({ async = false })

          -- 自动优化导入
          -- vim.cmd("TSLspOrganize")
          -- vim.cmd("TSLspImportAll")
        end,
      })
    end,
  },
}
