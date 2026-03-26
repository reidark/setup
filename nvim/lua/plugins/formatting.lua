return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      local function has_config(names)
        return function(_, ctx)
          local root = vim.fs.root(ctx.buf, names)
          return root ~= nil
        end
      end

      require("conform").setup({
        formatters_by_ft = {
          javascript = { "biome-check", "prettier", stop_after_first = true },
          javascriptreact = { "biome-check", "prettier", stop_after_first = true },
          typescript = { "biome-check", "prettier", stop_after_first = true },
          typescriptreact = { "biome-check", "prettier", stop_after_first = true },
          json = { "biome-check", "prettier", stop_after_first = true },
          jsonc = { "biome-check", "prettier", stop_after_first = true },

          astro = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          html = { "prettier" },
          markdown = { "prettier" },
          mdx = { "prettier" },
          yaml = { "prettier" },
          graphql = { "prettier" },

          lua = { "stylua" },
        },

        format_on_save = function(bufnr)
          return {
            timeout_ms = 3000,
            lsp_format = "fallback",
          }
        end,

        formatters = {
          ["biome-check"] = {
            condition = has_config({ "biome.json", "biome.jsonc" }),
          },
          prettier = {
            condition = has_config({
              ".prettierrc",
              ".prettierrc.js",
              ".prettierrc.cjs",
              ".prettierrc.json",
              ".prettierrc.yaml",
              ".prettierrc.yml",
              ".prettierrc.toml",
              "prettier.config.js",
              "prettier.config.cjs",
            }),
          },
        },
      })

      vim.keymap.set({ "n", "v" }, "<S-A-f>", function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end, { desc = "Format Document" })

      vim.keymap.set({ "n", "v" }, "<leader>cf", function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end, { desc = "Format Document" })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "biome",
          "prettier",
          "stylua",
          "eslint-lsp",
        },
      })
    end,
  },
}
