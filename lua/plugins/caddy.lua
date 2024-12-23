return {
  "isobit/vim-caddyfile",
  config = function()
    local client = vim.lsp.start_client({
      name = "caddyfilelsp",
      cmd = { "/Volumes/code/com.github/DoubleDD/learnlsp/main" },
      on_attach = function(client, bufnr) end,
    })

    if not client then
      vim.notify("hey ,you didnt do the client thing good")
      return
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "caddyfile123",
      callback = function()
        vim.lsp.buf_attach_client(0, client)
      end,
    })
  end,
}
