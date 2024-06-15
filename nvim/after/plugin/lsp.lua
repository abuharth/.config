local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = ''
})

lsp_zero.set_server_config({
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    }),
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = " (" .. (strings[2] or "") .. ")"
            return kind
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }, {
        { name = 'nvim_lsp_signature_help' },
        { name = 'calc' },
    }),
})


require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "pylsp",
        "pyright",
        "clangd",
        "tsserver",
    },
    handlers = {
        lsp_zero.default_setup,

        -- setup individual language servers
        pylsp = function()
            require('lspconfig').pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = {'E501', 'E226'}, -- line too long
                            },
                        }
                    }
                }
            })
        end,
        clangd = function()
            require('lspconfig').clangd.setup({
                cmd = {
                    "clangd",
                    "--header-insertion=never",
                    "--log=verbose",
                },
            })
        end,
    },
}

lsp_zero.setup()
