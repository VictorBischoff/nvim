return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          -- Customize tsserver settings
          handlers = {
            ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
              -- Filter out diagnostic with the code 80001 (CommonJS to ES Module warning)
              result.diagnostics = vim.tbl_filter(function(diagnostic)
                return diagnostic.code ~= 80001
              end, result.diagnostics)

              -- Call the original handler
              return vim.lsp.handlers["textDocument/publishDiagnostics"](_, result, ctx, config)
            end,
          },
        },
      },
    },
  },
}
