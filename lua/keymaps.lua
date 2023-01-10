local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
keymap("", ";", ":", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function mapkey(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap=true})
end

local function mapcmd(key, cmd)
    vim.api.nvim_set_keymap('n', key, ':'..cmd..'<cr>', {noremap=true})
end

local function maplua(key, txt)
    vim.api.nvim_set_keymap('n', key, ':lua '..txt..'<cr>', {noremap=true})
end

--Remap space as leader key
mapcmd("s", "<Nop>")
mapcmd("S", "<Nop>")
mapcmd("R", "<Nop>")
mapcmd("<LEADER><CR>", "noh")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
keymap("n", "S", ":w<CR> :lua vim.notify('Save Complete', 'info', { title = 'User Operation', timeout = 1000, stages = 'fade_in_slide_out'})<CR>", opts)
keymap("n", "Q", ":q!<CR>", opts)
keymap("", "R", ":source $MYVIMRC<CR>", opts)
keymap("", "cd", ":chdir", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Toggle neo-tree.nvim
mapcmd("tt", ":NeoTreeShowToggle")
mapcmd("np", ":NoNeckPain")
-- mapcmd("tf", ":NeoTreeFloatToggle")
-- mapcmd("tg", ":Neotree float git_status git_base=main")

-- jump back and forth in frames
mapkey("n", "<LEADER>l", "<C-w>l", opts)
mapkey("n", "<LEADER>h", "<C-w>h", opts)
mapkey("n", "<LEADER>j", "<C-w>j", opts)
mapkey("n", "<LEADER>k", "<C-w>k", opts)
mapkey("n", "<LEADER><LEADER>", "<C-f>", opts)
mapkey("n", "<LEADER>bb", "<C-b>", opts)
mapkey("n", "<LEADER>sv", "<C-w>t<C-w>H", opts)
mapkey("n", "<LEADER>sh", "<C-w>t<C-w>K", opts)
mapkey("n", "s", "<Plug>(easymotion-bd-f)", opts)

-- refactor C-a and C-x
mapkey("n", "+", "<C-a>", opts)
mapkey("n", "-", "<C-x>", opts)

-- auto-sessionn nvim
-- :SaveSession " saves or creates a session in the currently set `auto_session_root_dir`.
-- :SaveSession ~/my/custom/path " saves or creates a session in the specified directory path.
-- :RestoreSession " restores a previously saved session based on the `cwd`.
-- :RestoreSession ~/my/custom/path " restores a previously saved session based on the provided path.
-- :RestoreSessionFromFile ~/session/path " restores any currently saved session
-- :DeleteSession " deletes a session in the currently set `auto_session_root_dir`.
-- :DeleteSession ~/my/custom/path " deleetes a session based on the provided path.
-- :Autosession search
-- :Autosession delete
maplua(";fs", "require('session-lens').search_session()")
mapcmd("<LEADER>fs", ":SearchSession")
mapcmd("<LEADER>ss", ":SaveSession")
mapcmd("<LEADER>sr", ":RestoreSession")
mapcmd("<LEADER>ds", ":DeleteSession")
mapcmd("<LEADER>A", ":Alpha")

-- markdown-preview
mapcmd("<LEADER>mp", ":MarkdownPreview")
mapcmd("<LEADER>ms", ":MarkdownPreviewStop")
mapcmd("<LEADER>mt", ":MarkdownPreviewToggle")

keymap("", "<LEADER>cd", ":cd %:p:h<CR>:pwd<CR>", opts)

-- split
mapcmd("sl", "set splitright<CR>:vsplit<CR>")
mapcmd("sh", "set nosplitright<CR>:vsplit<CR>")
mapcmd("sk", "set splitbelow<CR>:split<CR>")
mapcmd("sj", "set splitbelow<CR>:split<CR>")


-- change split size using alt+arrow
mapcmd("<M-left>", "vertical resize -5<cr>")
mapcmd("<M-down>", "resize +5<cr>")
mapcmd("<M-up>", "resize -5<cr>")
mapcmd("<M-right>", "vertical resize +5<cr>")

mapcmd("th", ":TablineBufferPrevious")
mapcmd("tl", ":TablineBufferNext")

mapkey("n", ";fe", "<cmd>Telescope file_browser<cr>")
mapkey("n", ";ff", "<cmd>Telescope find_files<CR>", opts)
mapkey("n", ";fg", "<cmd>Telescope live_grep<cr>", opts)
mapkey("n", ";fb", "<cmd>Telescope buffers<cr>", opts)
mapkey("n", ";fh", "<cmd>Telescope help_tags<cr>", opts)
mapkey("n", ";fy", "<cmd>Telescope lsp_document_symbols<cr>", opts)
mapkey("n", ";gc", "<cmd>Telescope git_commits<cr>", opts)
mapkey("n", ";gbc", "<cmd>Telescope git_bcommits<cr>", opts)
mapkey("n", ";gbr", "<cmd>Telescope git_branches<cr>", opts)
mapkey("n", ";gst", "<cmd>Telescope git_status<cr>", opts)

-- SarchBox Key Bindings
mapcmd("<LEADER>s", "SearchBoxIncSearch")
mapcmd("<LEADER>r", "SearchBoxReplace confirm=menu")
mapcmd("<LEADER>lg", "LazyGit")

-- Comment
maplua("<LEADER>/", 'require("Comment.api").toggle_current_linewise()')
keymap("v", "<LEADER>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", opts)

-- treesj nvim
-- :TSJToggle :TSJJoin :TSJSplit
mapcmd("tg", ":TSJToggle")
mapcmd("tj", ":TSJJoin")
mapcmd("ts", ":TSJSplit")
