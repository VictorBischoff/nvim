return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "html", "css", "json" },
        }),
      })
    end,
  },
}
