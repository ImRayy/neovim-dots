local function is_format_enabled(bufnr)
  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    return
  end
end

local slow_format_filetypes = { "typescript", "typescriptreact", "javascriptreact" }

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConfirmInfo" },
  opts = {
    formatters = {
      sql_formatter = {
        prepend_args = {
          "--config",
          '{"expressionWidth": "50", "keywordCase":"upper","dataTypeCase":"upper","functionCase":"upper"}',
        },
      },
      biome = {
        inherit = false,
        command = "biome",
        args = {
          "check",
          "--formatter-enabled=true",
          "--linter-enabled=true",
          "--organize-imports-enabled=true",
          "--write",
          "--unsafe",
          "--no-errors-on-unmatched",
          "$FILENAME",
        },
        stdin = false,
      },
    },
    formatters_by_ft = {
      go = { "gofumpt" },
      astro = { "biome", "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "biome", "prettier" },
      jsonc = { "biome", "prettier" },
      javascript = { "biome", "prettier", "prettierd" },
      typescript = { "biome", "prettier", "prettierd" },
      typescriptreact = { "biome", "prettierd", "prettier" },
      yaml = { "prettier" },
      lua = { "stylua" },
      python = { "black", "yapf" },
      bash = { "beautysh" },
      zsh = { "beautysh" },
      toml = { "taplo" },
      sql = { "sql_formatter" },
      nix = { "alejandra" },
      markdown = { "prettier" },
    },

    format_on_save = function(bufnr)
      if is_format_enabled(bufnr) then
        return
      end

      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      if slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      local function on_format(err)
        if err and err:match("timeout$") then
          slow_format_filetypes[vim.bo[bufnr].filetype] = true
        end
      end

      return { timeout_ms = 200, lsp_fallback = true }, on_format
    end,

    format_after_save = function(bufnr)
      if is_format_enabled(bufnr) then
        return
      end

      if not slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      return { lsp_fallback = true }
    end,
  },
}
