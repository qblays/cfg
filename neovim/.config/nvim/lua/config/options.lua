-- Set to `false` to globally disable
vim.g.snacks_animate = false

-- Theme / UI
vim.o.background = "dark"

-- Kanagawa: load the "wave" variant.
-- (pcall so it won't error during early startup if the plugin isn't available yet)
pcall(function()
  require("kanagawa").load("wave")
end)

-- If you prefer the classic way instead of require().load():
-- vim.cmd("colorscheme kanagawa")

-- Diff options (you had multiple variants; last one in your dump was inline:word)
-- vim.opt.diffopt = "filler,internal,closeoff,algorithm:histogram,context:5,linematch:60,"
vim.opt.diffopt = "filler,internal,closeoff,algorithm:histogram,context:5,linematch:60,inline:word"

-- Earlier variants seen in your undo-strings (kept here for reference):
-- vim.o.diffopt = "internal,filler,closeoff,linematch:60"
-- vim.opt.diffopt = "filler,internal,closeoff,inline:char"
-- vim.opt.diffopt = "filler,internal,closeoff,linematch:1"
