return {
  -- disable noice
  { "folke/noice.nvim", enabled = true },

  -- themes / colorschemes
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
  {
    url = "https://codeberg.org/jthvai/lavender.nvim",
    branch = "stable",
    lazy = false,
    priority = 1000,
  },
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "thesimonho/kanagawa-paper.nvim", lazy = false, priority = 1000, opts = {} },

  -- LazyVim itself (sets colorscheme)
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },

  -- LSP (clangd settings)
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "-j=20",
            "--background-index",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--malloc-trim",
          },
          init_options = {
            fallbackFlags = { "-std=c++20" },
          },
        },
      },
    },
  },

  -- Git
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional diff integration
    },
    config = true,
  },
  "tpope/vim-fugitive",
  { "esmuellert/vscode-diff.nvim", dependencies = { "MunifTanjim/nui.nvim" } },

  -- tmux navigation
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })
    end,
  },

  -- file manager
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- if your setup used the other variant at some point:
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
  { "benomahony/oil-git.nvim", dependencies = { "stevearc/oil.nvim" } },

  {
    "A7Lavinraj/fyler.nvim",
    branch = "stable",
    lazy = false,
    dependencies = { "nvim-mini/mini.icons" },
    opts = {},
  },

  -- delimiters / UI
  "HiPhish/rainbow-delimiters.nvim",

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          chars = {
            -- Your undo strings showed the quotes but not the actual characters.
            -- These are reasonable defaults; adjust if you remember different ones.
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = "▶",
          },
          style = "#00ffff",
          duration = 0,
          delay = 0,
        },
        indent = {
          enable = false,
          use_treesitter = false,
          delay = 0,
        },
        line_num = {
          enable = true,
          use_treesitter = true,
          -- Your undo dump also contained a style rainbow list at some point:
          -- style = {
          --   "#FF0000", "#FF7F00", "#FFFF00", "#00FF00",
          --   "#00FFFF", "#0000FF", "#8B00FF",
          -- },
        },
        blank = {
          enable = false,
        },
      })
    end,
  },

  -- big files
  {
    "LunarVim/bigfile.nvim",
    opts = {
      filesize = 2, -- MiB
      pattern = { "*" },
      features = {
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
      },
    },
  },

  -- fff picker
  {
    "dmtrKovalenko/fff.nvim",
    lazy = false,
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    opts = {
      debug = {
        enabled = true,
        show_scores = true,
      },
    },
    keys = {
      {
        "ff",
        function()
          require("fff").find_files()
        end,
        desc = "FFFind files",
      },
    },
  },
}
