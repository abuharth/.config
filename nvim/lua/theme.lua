local function center(str)
  local width = vim.api.nvim_win_get_width(0)
  local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
  return string.rep(' ', shift) .. str
end

function ThemesWindow()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_option_value('bufhidden', 'wipe', {buf=buf})
    -- get dimensions
    local width = vim.api.nvim_get_option_value("columns", {})
    local height = vim.api.nvim_get_option_value("lines", {})

    local win_height = math.ceil(height * 0.8 - 4)
    local win_width = math.ceil(width * 0.8)
    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    local opts = {
        style = 'minimal',
        relative = 'editor',
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        border = 'rounded',
    }

    local win = vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_set_option_value('cursorline', true, {win=win})
    -- clear mappings
    local clear_mappings = { 'a', 'i', 'v', 'c', 'r', 'd', 's' }
    for i,v in pairs(clear_mappings) do
        vim.api.nvim_buf_set_keymap(buf, 'n', v, '', {nowait=true, noremap=true, silent=true})
        vim.api.nvim_buf_set_keymap(buf, 'n', string.upper(v), '', {nowait=true, noremap=true, silent=true})
    end
    -- quit
    local quit_mappings = { 'q', 'u', '<cr>', '<Escape>' }
    for i,v in pairs(quit_mappings) do
        vim.api.nvim_buf_set_keymap(buf, 'n', v,
            "<cmd> lua vim.api.nvim_win_close(0, true)<cr>",
        {nowait=true, noremap=true, silent=true})
    end

    local move_mappings = { 'h', 'j', 'k', 'l', '<Up>', "<Down>", "<Left>", "Right>" }
    for i,v in pairs(move_mappings) do
        local offset = 0
        if (v == '<UP>' or v == 'k') then
            offset = -1
        elseif (v == '<Down>' or v == 'j') then
            offset = 1
        end
        vim.api.nvim_buf_set_keymap(buf, 'n', v, '<cmd>lua SetTheme(math.min(vim.api.nvim_buf_line_count(0) - 7, math.max(1, vim.api.nvim_win_get_cursor(0)[1] - 7 +' .. offset .. ')))<cr>' .. v, {nowait=true, noremap=true, silent=true})
    end

    local dummyStr = "                                                "
    local pad = math.floor(vim.api.nvim_win_get_width(0) / 2) - math.floor(string.len(dummyStr) / 2)
    local padStr = string.rep(' ', pad)
    local title = {
        padStr .. "___________.__                                  ",
        padStr .. "\\__    ___/|  |__   ____   _____   ____   ______",
        padStr .. "  |    |   |  |  \\_/ __ \\ /     \\_/ __ \\ /  ___/",
        padStr .. "  |    |   |   Y  \\  ___/|  Y Y  \\  ___/ \\___ \\ ",
        padStr .. "  |____|   |___|  /\\___  >__|_|  /\\___  >____  >",
        padStr .. "                \\/     \\/      \\/     \\/     \\/ ",
        " ",
    }

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, title)

    local result = {}
    for i, v in pairs(vim.fn.getcompletion("", "color")) do
       result[i] = center(v)
    end

    vim.api.nvim_buf_set_lines(buf, -1, -1, false, result)
    vim.api.nvim_win_set_cursor(win, {8, 0})
end

function SetTheme(color, transparency)
    local colors = vim.fn.getcompletion("", "color")
    local colorStr
    -- handle integer input for colors
    if (type(color) == "number") then
        colorStr = colors[color]
    else
        colorStr = color
    end

    vim.cmd.colorscheme(colorStr)

    if transparency then
        vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end

    local cmd = colorStr .. ' ' .. (transparency and "1" or "-1")

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
