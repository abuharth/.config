-- for gruvbox: vim.o.background = "dark" // or "light"
-- before to switch to light mode

function ListThemes()
    print("gruvbox")
    print(" ")
    print("rose-pine-main")
    print("rose-pine-moon")
    print("rose-pine-dawn")
    print(" ")
    print("kanagawa-wave")
    print("kanagawa-dragon")
    print("kanagawa-lotus")
    print(" ")
    print("tokyonight-storm")
    print("tokyonight-moon")
    print("tokyonight-day")
    print("tokyonight-night")
end


function ColorMyPencils(color, bg)
	vim.cmd.colorscheme(color)

	if bg == true then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end

    require("lualine").setup({
        options = {
            theme = "auto",
        }
    })
end

ColorMyPencils("tokyonight")
