return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "ivy",
					},
				},
				extensions = {
					fzf = {},
				},
			})
			telescope.load_extension("fzf")
			vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>n", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>se", "<cmd>Telescope session-lens<CR>")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
