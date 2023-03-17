local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- NeoTree
map("n", "<C-b>", "<CMD>Neotree toggle<CR>")
--map("n", "<leader>o", "<CMD>Neotree focus<CR>")
