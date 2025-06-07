local opt = vim.opt

-- Appearance
opt.guicursor = ""
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.laststatus = 0
opt.showmode = false
opt.list = true
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 8
opt.sidescrolloff = 8
-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.shiftround = true
opt.breakindent = true

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = false
opt.undodir = vim.fn.stdpath("config") .. "/undodir"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Behavior
opt.wrap = false
opt.mouse = "a"
opt.autowrite = true
opt.confirm = true
opt.timeoutlen = 150
opt.completeopt = { "menu", "menuone", "noselect" }

-- Grep
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- File & Buffer Options
opt.isfname:append("@-@")
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.formatoptions = "jcroqlnt"
opt.spelllang = { "en" }

-- Short Messages
opt.shortmess:append({ W = true, I = true, c = true })
opt.splitbelow = true
opt.splitright = true
