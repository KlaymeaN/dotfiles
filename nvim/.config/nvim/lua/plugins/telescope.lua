return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' } ,

     
    opts = {
        defaults = {
            sorting_strategy = "ascending",
            layout_strategy = "flex",
            layout_config = {
                horizontal = { preview_cutoff = 80, preview_width = 0.55 },
                vertical = { mirror = true, preview_cutoff = 25 },
                prompt_position = "top",
                width = 0.87,
                height = 0.80,
            },
        },
    },



    }
