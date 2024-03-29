-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
    --  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    --  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    --  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    --  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    --  ['<C-e>'] = cmp.mapping({
    --    i = cmp.mapping.abort(),
    --    c = cmp.mapping.close(),
    --  }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
      ['<Down>'] = cmp.mapping.select_next_item(select_opts),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(select_opts),
      ['<Tab>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
    },
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'nvim_lsp', keyword_length = 3 },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip', keyword_length = 3 }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      { name = 'buffer', keyword_length = 3 },
    }),
    window = {
      documentation = cmp.config.window.bordered()
    },
    formatting = {
      fields = {'menu', 'abbr', 'kind'}
    },
})
-- 
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    { name = 'buffer' },
  })
})
-- 
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
-- 
--   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, {
--       { name = 'cmdline' }
--     })
-- })

--   -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
--   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--     capabilities = capabilities
--   }
-- end

require("luasnip.loaders.from_vscode").load()
-- require'luasnip'.filetype_extend("ruby", {"rails"})

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
