return {
	"mfussenegger/nvim-dap",
	dependencies = { "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui" },
	config = function()
		local dap = require("dap")
		local ui = require("dap.ui")
		local keymap = vim.keymap
		dap.listeners.before.attach.ui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.ui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.ui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.ui_config = function()
			ui.close()
		end
		keymap.set("n", "<leader>dt", dap.toggle_breakpoint)
		keymap.set("n", "<leader>dc", dap.continue)
	end,
}
