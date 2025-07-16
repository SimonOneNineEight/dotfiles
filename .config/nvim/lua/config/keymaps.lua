-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- TEXT OBJECTS REFERENCE:
-- Text objects define WHAT to operate on, operators define WHAT TO DO
-- Pattern: [operator][text object]
-- 
-- Built-in text objects:
-- iw/aw = inner/around word
-- is/as = inner/around sentence  
-- ip/ap = inner/around paragraph
-- i"/a" = inside/around quotes (also works with ' and `)
-- i(/a( = inside/around parentheses (also works with ), {, }, [, ], <, >)
-- 
-- Examples:
-- ciw = change inner word
-- di" = delete inside quotes
-- ya{ = yank around braces
-- vi( = visually select inside parentheses
-- 
-- SURROUND PLUGIN (mini.surround):
-- gsa = add surrounding (e.g., gsaiw" adds quotes around word)
-- gsd = delete surrounding (e.g., gsd" removes quotes)
-- gsr = replace surrounding (e.g., gsr"' changes quotes to single quotes)
-- gsf = find surrounding (highlights next surrounding)
-- 
-- MULTIPLE OCCURRENCES EDITING:
-- * = search for word under cursor
-- cgn = change next search match
-- . = repeat last change
-- n = go to next match (use before . to change it)

local keymap = vim.keymap
local opt = { noremap = true, silent = true }

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
keymap.set("n", "<leader>se", vim.diagnostic.open_float, { desc = "[S]how diagnostic [E]rror messages" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Move between directories
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Return to [P]re[V]ious directory" })

-- Move the highlighted text and automatically indent
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Set the next line to the end ot the line
keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle while moving
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Paste while keep the copyed text in the buffer
-- keymap.set("x", "<leader>p", '[["_dP]]')

-- Delete wihout cutting
keymap.set("x", "<leader>d", '"_d')

-- Set x to _x to delete character without affecting the clipboard
keymap.set("n", "x", '"_x')

-- Select all
keymap.set("n", "<C-a>", "ggVG")

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [V]ertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window [H]orizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plit window [E]qual Size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
