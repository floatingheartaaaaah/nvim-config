return {
	"amitds1997/remote-nvim.nvim",
	version = "0.3.11", -- Pin to GitHub releases
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local remote = require("remote-nvim")
		local utils = require("remote-nvim.utils")
		local constants = require("remote-nvim.constants")

		remote.setup({
			devpod = {
				binary = "devpod",
				docker_binary = "docker",
				ssh_config_path = utils.path_join(vim.fn.stdpath("data"), constants.PLUGIN_NAME, "ssh_config"),
				search_style = "current_dir_only",
				dotfiles = {
					path = nil,
					install_script = nil,
				},
				gpg_agent_forwarding = false,
				container_list = "running_only",
			},

			ssh_config = {
				ssh_binary = "ssh",
				scp_binary = "scp",
				ssh_config_file_paths = { "$HOME/.ssh/config" },
				ssh_prompts = {
					{
						match = "password:",
						type = "secret",
						value_type = "static",
						value = "",
					},
					{
						match = "continue connecting (yes/no/[fingerprint])?",
						type = "plain",
						value_type = "static",
						value = "",
					},
				},
			},

			neovim_install_script_path = utils.path_join(
				vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h:h:h"),
				"scripts",
				"neovim_install.sh"
			),

			progress_view = {
				type = "popup",
			},

			offline_mode = {
				enabled = false,
				no_github = false,
				cache_dir = utils.path_join(vim.fn.stdpath("cache"), constants.PLUGIN_NAME, "version_cache"),
			},

			remote = {
				app_name = "nvim",
				copy_dirs = {
					config = {
						base = vim.fn.stdpath("config"),
						dirs = "*",
						compression = {
							enabled = false,
							additional_opts = {},
						},
					},
					data = {
						base = vim.fn.stdpath("data"),
						dirs = {},
						compression = {
							enabled = true,
						},
					},
					cache = {
						base = vim.fn.stdpath("cache"),
						dirs = {},
						compression = {
							enabled = true,
						},
					},
					state = {
						base = vim.fn.stdpath("state"),
						dirs = {},
						compression = {
							enabled = true,
						},
					},
				},
			},

			client_callback = function(port, _)
				require("remote-nvim.ui").float_term(
					("nvim --server localhost:%s --remote-ui"):format(port),
					function(exit_code)
						if exit_code ~= 0 then
							vim.notify(
								("Local client failed with exit code %s"):format(exit_code),
								vim.log.levels.ERROR
							)
						end
					end
				)
			end,

			log = {
				filepath = utils.path_join(vim.fn.stdpath("state"), ("%s.log"):format(constants.PLUGIN_NAME)),
				level = "info",
				max_size = 1024 * 1024 * 2,
			},
		})
	end,
}
