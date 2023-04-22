
local map = vim.api.nvim_set_keymap
local snr = {
    noremap = true,
    silent = true
}

map('n', '<CR>', ':noh<CR><CR>', snr) -- unsets 'last search pattern' register by hitting return

map('n', '<Leader>t', ':enew<CR>', snr) -- open a new empty  buffer
map('n', '<Leader>l', ':bnext<CR>', snr) -- move to the next buffer
map('n', '<Leader>h', ':bprevious<CR>', snr) -- move to the previous buffer
map('n', '<Leader>bq', ':bp <BAR> bd #<CR>', snr) -- close the current buffer and move to a previous one

local function bufmap(...) vim.api.nvim_buf_set_keymap(0, ...) end
local mappings = {}
function mappings:mapNvimTree()
   map('n', '<Leader>n', ':NvimTreeToggle<CR>', snr)
end

function mappings:mapTelescope()
    map('n', '<Leader>ff', ':Telescope find_files<CR>', snr)
    map('n', '<Leader>fg', ':Telescope live_grep<CR>', snr)
    map('n', '<Leader>fb', ':Telescope buffers<CR>', snr)
    map('n', '<Leader>fh', ':Telescope help_tags<CR>', snr)
end

function mappings:mapIDE()
    map('n', '<Leader>fw', ':Workspace<CR>', snr) -- uses telescope, hence fw
    map('n', '<Leader>ww', ':Workspace<CR>', snr) -- uses telescope, hence fw
    map('n', '<Leader>wo', ':Workspace Outline Focus<CR>', snr)
    map('n', '<Leader>wb', ':Workspace BufferList Focus<CR>', snr)
    map('n', '<Leader>we', ':Workspace Explorer Focus<CR>', snr)
    map('n', '<Leader>wg', ':Workspace RightPanelToggle<CR>', snr)
    map('n', '<Leader>wtb', ':Workspace TerminalBrowser Focus<CR>', snr)
    map('n', '<Leader>wt', ':Workspace Terminal Focus<CR>', snr)
    map('n', '<Leader>wr', ':Workspace Reset<CR>', snr)
end

function mappings:registerLSPMappings()
    -- See ":help vim.lsp.*" for docs on any of the below functions
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', snr)
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', snr)
    map('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', snr)
    map('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', snr)

    map('n', '?R', '<cmd>Telescope lsp_references<CR>', snr) -- references to the word under cursor
    map('n', '?T', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', snr) -- find any type in the workspace dnyamically
    map('n', '?i', '<cmd>Telescope lsp_implementations<CR>', snr) -- find implementations of an interface

    map('n', '<Leader>Ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', snr)
end

function mappings:registerTroubleMappings()
    map('n', '<Leader>wx', '<cmd>TroubleToggle<CR>', snr)
end

return mappings
