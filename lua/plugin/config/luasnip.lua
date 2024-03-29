-- luasnip.lua
--
-- Configuration file for Luasnip snippet engine plugin.
--
-- Also luasnip is required in @see cmp.lua, in cmp.setup

local luasnip = require("luasnip")
local types = require("luasnip.util.types")

require("luasnip/loaders/from_vscode").lazy_load()

luasnip.config.set_config({
	-- This tells LuaSnip to remember to keep around the last snippet.
	-- You can jump back into it even if you move outside of the selection
	history = false,

	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged,TextChangedI",

	-- Autosnippets:
	enable_autosnippets = false,
})

Map({ "i", "s" }, "<c-l>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end)

Map({ "i", "s" }, "<c-h>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end)

Map({ "i", "s" }, "<c-k>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end)
