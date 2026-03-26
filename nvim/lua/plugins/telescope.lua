return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    cmd = "Telescope",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<D-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },

      { "<C-S-p>", "<cmd>Telescope commands<CR>", desc = "Command Palette" },
      { "<D-S-p>", "<cmd>Telescope commands<CR>", desc = "Command Palette" },

      { "<C-S-f>", "<cmd>Telescope live_grep<CR>", desc = "Search in Files" },
      { "<D-S-f>", "<cmd>Telescope live_grep<CR>", desc = "Search in Files" },

      { "<C-g>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Go to Symbol in File" },
      { "<D-g>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Go to Symbol in File" },

      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document Symbols" },
      { "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace Symbols" },
      { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git Commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Git Branches" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git Status" },

      { "<C-S-o>", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Go to Symbol" },
      { "<D-S-o>", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Go to Symbol" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.5,
            },
            width = 0.87,
            height = 0.80,
          },
          mappings = {
            i = {
              ["<Esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
            },
          },
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            "dist/",
            "build/",
            ".next/",
            "%.lock",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })

      telescope.load_extension("fzf")
    end,
  },
}
