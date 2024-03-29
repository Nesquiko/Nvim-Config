-- mason.lua
--
-- Configuration for mason plugin, which is a improved replacement for
-- Lsp-installer.

require("mason").setup()

local servers = {
	"lua_ls",
	"jsonls",
	"pyright",
	"gopls",
	"tsserver",
	"marksman",
	"rust_analyzer",
	"solidity_ls_nomicfoundation",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local opts = {
	on_attach = require("plugin.config.lsp.handlers").on_attach,
	capabilities = require("plugin.config.lsp.handlers").capabilities,
}

local lspconfig = require("lspconfig")

local rust_analyzer_opts = require("plugin.config.lsp.settings.rust_analyzer")
lspconfig.rust_analyzer.setup(
	vim.tbl_deep_extend("force", rust_analyzer_opts, opts)
)
lspconfig.marksman.setup(opts)
lspconfig.tsserver.setup(opts)
lspconfig.tailwindcss.setup(opts)
lspconfig.bashls.setup(opts)

local lua_ls_opts = require("plugin.config.lsp.settings.sumneko_lua")
lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", lua_ls_opts, opts))

local jsonls_opts = require("plugin.config.lsp.settings.jsonls")
lspconfig.jsonls.setup(vim.tbl_deep_extend("force", jsonls_opts, opts))

local py_opts = require("plugin.config.lsp.settings.pyright")
lspconfig.pyright.setup(vim.tbl_deep_extend("force", py_opts, opts))

local go_opts = require("plugin.config.lsp.settings.gopls")
lspconfig.gopls.setup(vim.tbl_deep_extend("force", go_opts, opts))

local solidity_opts = require("plugin.config.lsp.settings.solidity")
lspconfig.solidity_ls_nomicfoundation.setup(
	vim.tbl_deep_extend("force", solidity_opts, opts)
)
