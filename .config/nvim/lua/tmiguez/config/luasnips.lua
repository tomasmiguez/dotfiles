require("luasnip").config.set_config {
  enable_autosnippets = true,
  -- store_selection_keys = "<Tab>",
}

vim.cmd [[
" Expand or jump in insert mode
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

" Jump forward through tabstops in visual mode
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Jump backward through snippet tabstops with Shift-Tab
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/luasnippets/"})
