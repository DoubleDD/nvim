return {
  {
    "liuchengxu/vista.vim",
    config = function()
      -- 设置 vista 使用 LSP 作为大纲的来源
      vim.g.vista_default_executive = "nvim_lsp"
    end,
  },
}
