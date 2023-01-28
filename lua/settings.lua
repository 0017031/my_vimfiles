vim.o.modeline = false
vim.o.modelines = 0
vim.cmd.colorscheme('m2dark')

local remap = vim.keymap.set
remap('n', ';', ':')
remap('n', '\'', '"')
remap('n', '"', '\'')
remap('n', '<F9>', ':w<CR>:so %<CR>')
remap('i', '<F9>', '<ESC>:w<CR>:so %<CR>')

local value_options = {
    modeline = false, modelines = 0, -- Avoid modeline vulnerability
    helplang = 'en', langmenu = 'en_US.UTF-8', encoding = 'UTF-8',
    wildmenu = true, wildmode = 'longest,list,full',
    cmdheight = 2,
    tabstop = 4, textwidth = 120,
}

local TRUE_options = {
    'cursorline', -- highlight current line
    'number', 'relativenumber',
    'smartcase', 'ignorecase',
    'termguicolors',
    'undofile',
}

local FALSE_options = {
    'backup',
    'wrap',
    'wrapscan', -- Searches DON'T wrap around the end of the file.
}

for _, v in ipairs(TRUE_options) do
    vim.opt[v] = true
end

for _, v in ipairs(FALSE_options) do
    vim.opt[v] = false
end

for k, v in pairs(value_options) do
    vim.opt[k] = v
end


