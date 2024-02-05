-- Themes:
-- gruvbox
-- rose-pine
-- kanagawa

function ColorMyPencils(color, bg)
	color = color
	vim.cmd.colorscheme(color)

	if bg == true then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

ColorMyPencils("gruvbox", true)
