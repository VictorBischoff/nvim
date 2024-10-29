return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = opts.sources or {}

      -- Use the regular eslint
      vim.list_extend(opts.sources, {
        null_ls.builtins.diagnostics.eslint.with({
          filetypes = { "javascript", "typescript" }, -- JS and TS only
        }),
      })
    end,
  },
}
