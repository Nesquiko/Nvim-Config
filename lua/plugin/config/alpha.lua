-- alpha.lua
-- Config file for goolord/alpha-nvim
--
-- Dashboard themes is used with programming quotes in the
-- footer.
--
-- NOTE: documentation on the goolord/alpha-nvim is terrible,
-- 	maybe look into glepnir/dashboard-nvim

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[     __                          _  _          ]],
	[[  /\ \ \ ___  ___   __ _  _   _ (_)| | __ ___  ]],
	[[ /  \/ // _ \/ __| / _` || | | || || |/ // _ \ ]],
	[[/ /\  /|  __/\__ \| (_| || |_| || ||   <| (_) |]],
	[[\_\ \/  \___||___/ \__, | \__,_||_||_|\_\\___/ ]],
	[[                      |_|                      ]],

	-- [[███╗   ██╗███████╗███████╗ ██████╗ ██╗   ██╗██╗██╗  ██╗ ██████╗ ]],
	-- [[████╗  ██║██╔════╝██╔════╝██╔═══██╗██║   ██║██║██║ ██╔╝██╔═══██╗]],
	-- [[██╔██╗ ██║█████╗  ███████╗██║   ██║██║   ██║██║█████╔╝ ██║   ██║]],
	-- [[██║╚██╗██║██╔══╝  ╚════██║██║▄▄ ██║██║   ██║██║██╔═██╗ ██║   ██║]],
	-- [[██║ ╚████║███████╗███████║╚██████╔╝╚██████╔╝██║██║  ██╗╚██████╔╝]],
	-- [[╚═╝  ╚═══╝╚══════╝╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝  ╚═╝ ╚═════╝ ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button(
		"c",
		"  Configuration",
		":e ~/.config/nvim/init.lua <CR>"
	),
	dashboard.button("u", "  Update plugins", ":PackerSync<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
	local ok, fortune = pcall(require, "alpha.fortune")
	if not ok then
		return "https://github.com/Nesquiko"
	end

	return fortune()
end

dashboard.section.footer.val = footer()

-- different highlights for sections
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
