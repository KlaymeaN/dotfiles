return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Ensure devicons are installed
    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto', -- Automatically detects a theme
                icons_enabled = true, -- Enable icons
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
            },
        })
    end,
}

