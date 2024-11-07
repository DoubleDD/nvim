return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,   -- 使用 Prettier 格式化
        -- null_ls.builtins.diagnostics.eslint_d,  -- 使用 ESLint 进行诊断
        -- null_ls.builtins.code_actions.eslint_d, -- 使用 ESLint 进行代码操作
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
      },
    })
  end,
}
