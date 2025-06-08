return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended disabling of netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				float = {
					enable = true,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 100,
						height = 70,
						row = 2,
						col = 2,
					},
				},
				width = 40,
				side = "center",
				number = false,
				relativenumber = false,
				signcolumn = "yes",
				cursorline = true,
				debounce_delay = 15,
			},

			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "󰆤",
						hidden = "󰜌",
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "",
							untracked = "",
							deleted = "",
							ignored = "",
						},
					},
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false,
						modified = false,
						hidden = false,
						diagnostics = false,
						bookmarks = false,
					},
				},
			},

			diagnostics = {
				enable = false,
			},

			git = {
				enable = false,
				ignore = false,
			},

			filters = {
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				custom = {},
				exclude = {},
			},

			actions = {
				open_file = {
					quit_on_open = true,
				},
			},

			-- optional: disables window resizing behavior on open
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
		})
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
		vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
		vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })
	end,
}
