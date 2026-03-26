vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.number = true
opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.mouse = "a"

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

opt.updatetime = 250
opt.timeoutlen = 300

opt.completeopt = { "menu", "menuone", "noselect" }

opt.clipboard = "unnamedplus"

opt.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

opt.fillchars = { eob = " " }

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = { notify = false },
  checker = { enabled = true, notify = false },
})

local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })

map("n", "<C-z>", "u", { desc = "Undo" })
map("i", "<C-z>", "<C-o>u", { desc = "Undo" })
map("n", "<C-S-z>", "<C-r>", { desc = "Redo" })
map("i", "<C-S-z>", "<C-o><C-r>", { desc = "Redo" })

map("n", "<C-f>", "/", { desc = "Search in file" })

map("n", "<C-h>", ":%s/", { desc = "Search and replace" })

map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("n", "<A-S-j>", "<cmd>t.<CR>", { desc = "Duplicate line down" })
map("n", "<A-S-k>", "<cmd>t.-1<CR>", { desc = "Duplicate line up" })
map("v", "<A-S-j>", ":'<,'>t'><CR>gv", { desc = "Duplicate selection down" })
map("v", "<A-S-k>", ":'<,'>t'<-1<CR>gv", { desc = "Duplicate selection up" })

map("n", "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })

map("i", "<A-Left>", "<C-o>b", { desc = "Move word left" })
map("i", "<A-Right>", "<Esc>ea", { desc = "Move word right" })
map("n", "<A-Left>", "b", { desc = "Move word left" })
map("n", "<A-Right>", "e", { desc = "Move word right" })

map("i", "<S-Left>", "<Esc>v", { desc = "Select left" })
map("i", "<S-Right>", "<Esc>lv", { desc = "Select right" })
map("i", "<S-Up>", "<Esc>vk", { desc = "Select up" })
map("i", "<S-Down>", "<Esc>vj", { desc = "Select down" })
map("n", "<S-Left>", "vh", { desc = "Select left" })
map("n", "<S-Right>", "vl", { desc = "Select right" })
map("n", "<S-Up>", "vk", { desc = "Select up" })
map("n", "<S-Down>", "vj", { desc = "Select down" })
map("v", "<S-Left>", "h", { desc = "Extend select left" })
map("v", "<S-Right>", "l", { desc = "Extend select right" })
map("v", "<S-Up>", "k", { desc = "Extend select up" })
map("v", "<S-Down>", "j", { desc = "Extend select down" })

map("i", "<S-A-Left>", "<Esc>vb", { desc = "Select word left" })
map("i", "<S-A-Right>", "<Esc>lve", { desc = "Select word right" })
map("n", "<S-A-Left>", "vb", { desc = "Select word left" })
map("n", "<S-A-Right>", "ve", { desc = "Select word right" })
map("v", "<S-A-Left>", "b", { desc = "Extend select word left" })
map("v", "<S-A-Right>", "e", { desc = "Extend select word right" })

map("i", "<S-Home>", "<Esc>v^", { desc = "Select to line start" })
map("i", "<S-End>", "<Esc>lv$h", { desc = "Select to line end" })
map("n", "<S-Home>", "v^", { desc = "Select to line start" })
map("n", "<S-End>", "v$h", { desc = "Select to line end" })
map("v", "<S-Home>", "^", { desc = "Extend select to line start" })
map("v", "<S-End>", "$h", { desc = "Extend select to line end" })

map("n", "<C-Left>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-Down>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-Up>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-Right>", "<C-w>l", { desc = "Move to right window" })

map("n", "<C-w>", "<cmd>bdelete<CR>", { desc = "Close buffer" })

map("n", "<C-Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<C-S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

map("v", "p", '"_dP', { desc = "Paste without yanking" })

map("n", "<C-a>", "ggVG", { desc = "Select all" })

map({ "n", "i", "v" }, "<D-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })
map("n", "<D-z>", "u", { desc = "Undo" })
map("i", "<D-z>", "<C-o>u", { desc = "Undo" })
map("n", "<D-S-z>", "<C-r>", { desc = "Redo" })
map("i", "<D-S-z>", "<C-o><C-r>", { desc = "Redo" })
map("n", "<D-f>", "/", { desc = "Search in file" })
map("n", "<D-h>", ":%s/", { desc = "Search and replace" })
map("n", "<D-a>", "ggVG", { desc = "Select all" })
map("n", "<D-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<D-w>", "<cmd>bdelete<CR>", { desc = "Close buffer" })
map("n", "<D-`>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<D-`>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
