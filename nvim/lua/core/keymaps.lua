
local map = vim.keymap.set

-- lsp settings
map('n', '<Leader>li', ':LspManageServers<CR>')
map('n', '<Leader>LI', ':LspInstallServer<CR>')
map('n', '<Leader>ls', ':LspStatus<CR>')
map('n', '<Leader>lh', ':LspHover<CR>')

map('n', 'g]', ':LspNextDiagnostic<CR>')
map('n', 'g[', ':LspPreviousDiagnostic<CR>')
map('n', ']e', ':LspNextError<CR>')
map('n', '[e', ':LspPreviousError<CR>')
map('n', '<Leader>s', ':LspDefinition<CR>')

-- bufferline
map('n', '<leader>[', ':BufferLineCyclePrev<CR>')
map('n', '<leader>]', ':BufferLineCycleNext<CR>')
map('n', '<leader>wa', ':BufferLineCloseOthers<CR>')
map('n', '<leader>w[', ':BufferLineCloseLeft<CR>')
map('n', '<leader>w]', ':BufferLineCloseRight<CR>')
map('n', '<leader>ww', ':close<CR>')
