function ListThemes()
    print("___________.__                                  ")
    print("\\__    ___/|  |__   ____   _____   ____   ______")
    print("  |    |   |  |  \\_/ __ \\ /     \\_/ __ \\ /  ___/")
    print("  |    |   |   Y  \\  ___/|  Y Y  \\  ___/ \\___ \\ ")
    print("  |____|   |___|  /\\___  >__|_|  /\\___  >____  >")
    print("                \\/     \\/      \\/     \\/     \\/ ")
    print("-------------------")
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

    local cmd = color .. ' ' .. (transparency and "1" or "-1")

    vim.fn.system("echo \"" .. cmd .. "\" > ~/.config/nvim/lua/_theme")

    --[[
    require("lualine").setup({
        options = {
            theme = "auto",
        }
    })
    -- ]]
end

function LoadTheme()
    local str = vim.fn.system("cat ~/.config/nvim/lua/_theme")
    local lines = {}
    for s in string.gmatch(str, "%S+") do
        table.insert(lines, s)
    end
    SetTheme(lines[1], (lines[2] == '1') and true or false)
end

LoadTheme()
