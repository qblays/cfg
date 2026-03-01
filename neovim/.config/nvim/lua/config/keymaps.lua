-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- keymaps.lua

local map = vim.keymap.set

-- nvim-tmux-navigation keymaps (from your undo strings)
pcall(function()
  local nvim_tmux_nav = require("nvim-tmux-navigation")

  map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft,  { desc = "Tmux: left" })
  map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown,  { desc = "Tmux: down" })
  map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp,    { desc = "Tmux: up" })
  map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Tmux: right" })
  map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, { desc = "Tmux: last active" })
  map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, { desc = "Tmux: next" })
end)

-- fff.nvim key (you also had this in the plugin spec)
pcall(function()
  map("n", "ff", function()
    require("fff").find_files()
  end, { desc = "FFFind files" })
end)
