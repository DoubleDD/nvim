return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        caddyfile = { "caddyfmt" },
      },
      formatters = {
        caddyfmt = {
          command = "caddy",
          args = { "fmt", "-" }, -- 使用 "-" 表示从标准输入读取
          stdin = true, -- 启用标准输入
          -- 如果 caddy fmt 执行失败，显示错误信息
          on_stderr = function(err)
            print("Caddy format error: " .. err)
            vim.notify("Caddy format error: " .. err, vim.log.levels.ERROR)
          end,
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })
  end,
}
