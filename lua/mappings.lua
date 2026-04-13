require("nvchad.mappings")

-- Replaces :W with :w
vim.api.nvim_create_user_command("W", "w", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})

-- add yours here

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "gt", ":bnext<CR>", { desc = "Go to next tab" })
map("n", "gT", ":bNext<CR>", { desc = "Go to previous tab" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "gq", ":bdelete<CR>", { desc = "Close current tab" })
map("n", "|", "^")
map("v", "f", "$")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
