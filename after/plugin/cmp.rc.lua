local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
       local luasnip = prequire "luasnip"
       if not luasnip then
           return
       end
       luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      local luasnip = require "luasnip"
      if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      elseif luasnip.expandable() then
          luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
      else
          fallback()
      end
     end),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      local luasnip = require "luasnip"
      if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      elseif luasnip.expandable() then
          luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
      else
          fallback()
      end
    end),
  }),
  sources = cmp.config.sources({
    { name = "luasnip", priority = 1 },
    { name = 'nvim_lsp', priority = 2 },
    { name = 'buffer', priority = 3 },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

