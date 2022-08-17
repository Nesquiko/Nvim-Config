-- lsp-installer.lua
-- File for configuring extending options with specific ones from each
-- lsp installed.

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("plugin.config.lsp.handlers").on_attach,
		capabilities = require("plugin.config.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("plugin.config.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	elseif server.name == "sumneko_lua" then
		local sumneko_opts = require("plugin.config.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	elseif server.name == "pyright" then
		local pyright_opts = require("plugin.config.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	elseif server.name == "gopls" then
		local go_opts = require("plugin.config.lsp.settings.gopls")
		opts = vim.tbl_deep_extend("force", go_opts, opts)
	elseif server == "tsserver" then
		local tsserver_opts = require("plugin.config.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)