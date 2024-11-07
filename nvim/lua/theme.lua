function ListThemes()
    print("gruvbox")
    print("-------------------")
    print("rose-pine-main")
    print("rose-pine-moon")
    print("rose-pine-dawn")
    print("-------------------")
    print("kanagawa-wave")
    print("kanagawa-dragon")
    print("kanagawa-lotus")
    print("-------------------")
    print("tokyonight-storm")
    print("tokyonight-moon")
    print("tokyonight-day")
    print("tokyonight-night")
    print("-------------------")
    print("dracula")
    print("dracula-soft")
end

function SetTheme(color, transparency)
	vim.cmd.colorscheme(color)

	if transparency then
        vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end

    local file = io.open("nvim/lua/_theme", "w")
    io.output(file)
    io.write(color, "\n")
    if transparency then
        io.write("1\n")
    else
        io.write("-1\n")
    end
    io.close(file)

    -- require("lualine").setup({
    --     options = {
    --         theme = "auto",
    --     }
    -- })
end

function LoadTheme()
    local file = io.open("nvim/lua/_theme", "r")
    io.input(file)
    local color = io.read()
    local transparency
    if io.read() == '1' then
        transparency = true
    else
        transparency = false
    end
    io.close(file)

    SetTheme(color, transparency)
end

LoadTheme()
