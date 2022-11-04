local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local path_ok, path = pcall(require, "plenary.path")
if not path_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
local nvim_web_devicons = require "nvim-web-devicons"
local cdir = vim.fn.getcwd()

local function get_extension(fn)
    local match = fn:match("^.+(%..+)$")
    local ext = ""
    if match ~= nil then
        ext = match:sub(2)
    end
    return ext
end

local function icon(fn)
    local nwd = require("nvim-web-devicons")
    local ext = get_extension(fn)
    return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
    short_fn = short_fn or fn
    local ico_txt
    local fb_hl = {}

    local ico, hl = icon(fn)
    local hl_option_type = type(nvim_web_devicons.highlight)
    if hl_option_type == "boolean" then
        if hl and nvim_web_devicons.highlight then
            table.insert(fb_hl, { hl, 0, 1 })
        end
    end
    if hl_option_type == "string" then
        table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
    end
    ico_txt = ico .. "  "

    local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
    local fn_start = short_fn:match(".*/")
    if fn_start ~= nil then
        table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt - 2 })
    end
    file_button_el.opts.hl = fb_hl
    return file_button_el
end

local default_mru_ignore = { "gitcommit" }

local mru_opts = {
    ignore = function(path, ext)
        return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
    end,
}

--- @param start number
--- @param cwd string optional
--- @param items_number number optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
    opts = opts or mru_opts
    items_number = items_number or 9

    local oldfiles = {}
    for _, v in pairs(vim.v.oldfiles) do
        if #oldfiles == items_number then
            break
        end
        local cwd_cond
        if not cwd then
            cwd_cond = true
        else
            cwd_cond = vim.startswith(v, cwd)
        end
        local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
        if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
            oldfiles[#oldfiles + 1] = v
        end
    end

    local special_shortcuts = {'a', 's', 'd' }
    local target_width = 35

    local tbl = {}
    for i, fn in ipairs(oldfiles) do
        local short_fn
        if cwd then
            short_fn = vim.fn.fnamemodify(fn, ":.")
        else
            short_fn = vim.fn.fnamemodify(fn, ":~")
        end

        if(#short_fn > target_width) then
          short_fn = path.new(short_fn):shorten(1, {-2, -1})
          if(#short_fn > target_width) then
            short_fn = path.new(short_fn):shorten(1, {-1})
          end
        end

        local shortcut = ""
        if i <= #special_shortcuts then
          shortcut = special_shortcuts[i]
        else
          shortcut = tostring(i + start - 1 - #special_shortcuts)
        end

        local file_button_el = file_button(fn, " " .. shortcut, short_fn)
        tbl[i] = file_button_el
    end
    return {
        type = "group",
        val = tbl,
        opts = {},
    }
end

local cool = {
  [[    ███╗   ███╗ █████╗ ██╗  ██╗███████╗   ]],
  [[    ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝   ]],
  [[    ██╔████╔██║███████║█████╔╝ █████╗     ]],
  [[    ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝     ]],
  [[    ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗   ]],
  [[    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ]],
  [[      ██████╗ ██████╗  ██████╗ ██╗        ]],
  [[     ██╔════╝██╔═══██╗██╔═══██╗██║        ]],
  [[     ██║     ██║   ██║██║   ██║██║        ]],
  [[     ██║     ██║   ██║██║   ██║██║        ]],
  [[     ╚██████╗╚██████╔╝╚██████╔╝███████╗   ]],
  [[      ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   ]],
  [[███████╗████████╗██╗   ██╗███████╗███████╗]],
  [[██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝]],
  [[███████╗   ██║   ██║   ██║█████╗  █████╗  ]],
  [[╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  ]],
  [[███████║   ██║   ╚██████╔╝██║     ██║     ]],
  [[╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ]],
}

local headers = {cool}

local function header_chars()
  return headers[ math.random(#headers) ]
end

local function header_color()
  local lines = {}
  for i, line_chars in pairs(header_chars()) do
    local hi = "StartLogo" .. i
    local line = {
      type = "text",
      val = line_chars,
      opts = {
        hl = hi,
        shrink_margin = false,
        position = "center",
      },
    }
    table.insert(lines, line)
  end

  local output = {
    type = "group",
    val = lines,
    opts = { position = "center", },
  }

  return output
end

local section_mru = {
  type = "group",
  val = {
    {
      type = "text",
      val = "Recent files",
      opts = {
        hl = "SpecialComment",
        shrink_margin = false,
        position = "center",
      },
    },
    { type = "padding", val = 1 },
    {
      type = "group",
      val = function()
        return { mru(1, cdir, 9) }
      end,
      opts = { shrink_margin = false },
    },
  }
}

local buttons = {
  type = "group",
  val = {
    { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
    { type = "padding", val = 2 },
    dashboard.button("f", "🔍  Find file", ":Telescope find_files <CR>"),
    dashboard.button("F", "🔤  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("n", "💡  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("c", "📝  Configuration", ":e ~/.config/nvim/init.vim <CR>"),
    dashboard.button("C", "⚙️   Config lua", ":e ~/.config/nvim/lua/core/_init.lua <CR>"),
    dashboard.button("m", "⌨️   Key mappings", ":e ~/.config/nvim/lua/core/keymaps.lua <CR>"),
    dashboard.button("p", "💼  Plugins", ":e ~/.config/nvim/lua/core/plugins.lua <CR>"),
    dashboard.button("t", "📺  Start Screen", ":e ~/.config/nvim/lua/core/startup-screen.lua <CR>"),
    dashboard.button("u", "♻️   Update plugins" , ":PackerSync<CR>"),
    dashboard.button("q", "🚪  Quit" , ":qa<CR>"),
  },
  position = "center",
}

local opts = {
    layout = {
        { type = "padding", val = 2 },
        header_color(),
        { type = "padding", val = 2 },
        section_mru,
        { type = "padding", val = 2 },
        buttons,
    },
    opts = {
        margin = 5,
    },
}

alpha.setup(opts)
vim.cmd("hi StartLogo1                  guifg=#14067E ctermfg=18   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo2                  guifg=#15127B ctermfg=18   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo3                  guifg=#161870 ctermfg=18   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo4                  guifg=#172466 ctermfg=18   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo5                  guifg=#182E5B ctermfg=23   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo6                  guifg=#193A50 ctermfg=23   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo7                  guifg=#1A4647 ctermfg=23   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo8                  guifg=#1B5243 ctermfg=23   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo9                  guifg=#1C5F3F ctermfg=23   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo10                 guifg=#1D6C3C ctermfg=29   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo11                 guifg=#1E7939 ctermfg=29   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo12                 guifg=#1F8636 ctermfg=29   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo13                 guifg=#209330 ctermfg=29   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo14                 guifg=#21A02D ctermfg=35   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo15                 guifg=#22AD2A ctermfg=35   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo16                 guifg=#23B928 ctermfg=35   gui=NONE cterm=NONE")
vim.cmd("hi StartLogo17                 guifg=#28CC4C ctermfg=41   gui=NONE cterm=NONE")
