local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- NeoTree
map("n", "<C-b>", "<CMD>Neotree toggle<CR>")
--map("n", "<leader>o", "<CMD>Neotree focus<CR>")


--Telescope
-- sudo apt-get install ripgrep  necesario para busqueda de cadenas
local status, telescope = pcall(require, "telescope.builtin")
if status then
    -- Telescope
    map("n", "<C-p>", telescope.find_files)
    map("n", "<leader>lm", telescope.live_grep)
    map("n", "<leader>b", telescope.buffers)
    map("n", "<leader>fh", telescope.help_tags)
    map("n", "<leader>fs", telescope.git_status)
    map("n", "<leader>fc", telescope.git_commits)
    map("n", "<leader>fb", telescope.git_branches)
else
    print("Telescope not found")
end
