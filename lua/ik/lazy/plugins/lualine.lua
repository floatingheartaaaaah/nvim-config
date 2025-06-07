return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"EdenEast/nightfox.nvim",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			options = {
				theme = "carbonfox",
				icons_enabled = true,
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					"filename",
					{
						function()
							local clients = vim.lsp.get_active_clients({ bufnr = 0 })
							if #clients == 0 then
								return "No LSP"
							end
							local names = {}
							for _, client in ipairs(clients) do
								table.insert(names, client.name)
							end
							return "LSP: " .. table.concat(names, ", ")
						end,
						icon = " ",
						color = { fg = "#7aa2f7", gui = "bold" },
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "oil" },
		})
	end,
}
