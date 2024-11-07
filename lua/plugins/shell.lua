return {
  {
    "z0mbix/vim-shfmt",
    ft = { "sh" },
    config=function ()
      -- 保存文件时自动格式化代码
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.sh" },
        callback = function()
          -- 格式化代码
          vim.cmd("Shfmt")
        end,
      })
    end
  },
}
