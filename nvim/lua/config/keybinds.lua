-- [L]eader
vim.g.mapleader = " "

-- [a]ll
vim.keymap.set("n", "<leader>a", "ggVG")

-- [e]xplorer
vim.keymap.set("n", "<leader>e", vim.cmd.Oil)

-- [s]earch: Substitute word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- [y]ank
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- [p]aste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- [d]elete
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- [C]enter: Navigation with centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- [x]ecute
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")
