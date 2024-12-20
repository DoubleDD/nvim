return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      caddyfile = { "caddy" }, -- 将 caddy 与 caddyfile 文件类型关联
    }

    lint.linters.caddy = {
      cmd = "caddy",
      args = { "validate", "-" },
      stdin = true,
      source_name = "caddy",
      ignore_exitcode = true,
      parser = function(output)
        local diagnostics = {}
        if output.exit_code ~= 0 then
          local lines = vim.split(output, "\n")
          for _, line in ipairs(lines) do
            if string.sub(line, 1, 6) == "Error:" then
              vim.notify(line, vim.log.levels.WARN)
              local row_match = string.match(line, "Caddyfile:(%d+)")
              local row = row_match and tonumber(row_match) or 0

              -- 提取更简洁的错误信息
              local error_message = string.match(line, "caddyfile:(.*)") -- 使用 string.match 提取
              if error_message then -- 确保匹配成功
                error_message = string.sub(error_message, 2) --去除第一个空格
              else
                error_message = line -- 否则使用原来的方法，去除 Error: 前缀
              end

              table.insert(diagnostics, {
                lnum = row - 1, --nvim-lint 的行号从0开始
                col = 0,
                message = error_message,
                security = "error",
                source = "caddy",
              })
            end
          end
        end
        return diagnostics
      end,
      stream = "both",
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.diagnostic.config({
      virtual_text = { prefix = "●" },
      severity_sort = true,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
