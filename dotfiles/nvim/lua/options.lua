--[[

vim.opt for options
vim.cmd for commands
vim.fn for vimscript functions

--]]


-- Vim Options

-- use :options
vim.opt.number = true
--vim.opt.numberwidth = 2
vim.opt.relativenumber = true
--vim.opt.ruler = true



vim.opt.cursorline = true
--vim.o.cursorlineopt = "number"
--vim.api.nvim_set_hl(0, "CursorLineSign", {bg="none"})
--vim.opt.cursorcolumn = true

--vim.opt.numberwidth = 3

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false


-- indenting

-- set tabs to spaces
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 4 -- only for opening/closing files
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true


-- experimental
--vim.opt.swapfile = false
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250 --write to disk
vim.opt.timeoutlen = 300 -- which-key popup

vim.g.have_nerd_font = true
vim.opt.mouse = 'a'
--vim.opt.showmode = false
--vim.opt.breakindent = false

--set colorcolumn=80



-- whitespaces
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
--vim.opt.listchars = { trail = '·' }


-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"





-- automatically backup files
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backupdir"

-- automatically save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true




-- sync system clipboard
vim.opt.clipboard = "unnamedplus"

--vim.opt.scrolloff = 999
vim.opt.scrolloff = 10


vim.opt.virtualedit = "block" -- keep highlighting on lines that are not of the same length, in visual block mode

vim.opt.inccommand = "split" -- create new window for search results in global sub (%s)

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true -- better, gui-like colors


-- disable nvim intro
--vim.opt.shortmess:append "sI"



vim.opt.colorcolumn = "80"

--vim.opt.guicursor = "i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150"


-- command for special filetypes
--[[
" But set it to 100 chars when editing Kotlin.
autocmd filetype kotlin setlocal colorcolumn=100
]]






---- Auto indent on empty line.
vim.keymap.set('n', 'i', function ()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil
         and 'cc' or 'i'
end, {expr=true, noremap=true})








-- set fold method
--vim.opt.foldmethod = "syntax"
--vim.opt.foldmethod = "manual"
--vim.cmd("set foldmethod=syntax")
--vim.cmd("foldmethod=manual")
--vim.cmd("foldmethod=indent")

-- treesitter based folding
vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.cmd("set nofoldenable")



-- Remember folds
vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})


vim.cmd([[autocmd FileType * set formatoptions-=ro]]) -- no auto comments on new line





-- global status bar
vim.opt.laststatus = 3
--vim.cmd("set laststatus=3") -- only have one global bar
--vim.cmd("highlight WinSeparator guibg=None")

vim.opt.showmode = false -- disable mode indicator (using lualine)



-- auto cd into dir of file
--vim.cmd("set autochdir") -- automatically change cwd to root of file
vim.opt.autochdir = true



-- autostart commands
--[[
vim.api.nvim_create_autocmd("VimEnter", {
    command = "",
})
--]]



vim.opt.incsearch = true -- start searching before pressing enter
vim.opt.hlsearch = true


