local lsp = require("lsp-zero")


lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	-- 'sumnek#o_lua',
	'lua_ls',
	'rust_analyzer',
    'phpactor',
})

lsp.configure('phpactor', {
    on_attach = on_attach,
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
})

local function organize_imports()
    local params = {
        command = '_typescript.organizeImports',
        arguments = {vim.api.nvim_buf_get_name(0)},
        title ='',
    }
    vim.lsp.buf.execute_command(params)
end

lsp.configure('tsserver', {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = 'Organize Imports'
        }
    }
})

local cmp = require("cmp")
local cmp_select =  { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true } ),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = {},
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})


lsp.on_attach(function(client,bufnr)
	local opts = { buffer=bfnr, remap = false} 

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

	vim.keymap.set("n", "<leader>vcr", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set("n", "<leader>o", function() vim.cmd.OrganizeImports() end, opts)

end)
lsp.setup()
