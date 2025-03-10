local opt = vim.opt

-- line number
opt.number = true
opt.relativenumber = true

-- indent
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

-- wrap
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'
opt.showmode = false
opt.showcmd = false
opt.autoread = true
opt.cmdheight = 0

opt.list = true
opt.listchars = { tab = '▸ ', trail = '⋅', nbsp = '␣', extends = '❯', precedes = '❮' }

opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.undofile = true

-- clipboard
opt.clipboard:append('unnamedplus')

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append('=')

opt.laststatus = 3
