return {
  'vyfor/cord.nvim',
  branch = 'master',
  build = ':Cord update',
  opts = function()
    return {
      -- 📊 Display Configuration
      display = {
        theme = 'catppuccin', -- Set the icon theme to 'pastel'
        swap_icons  = true,
        swap_fields = true 
      },

      -- 💤 Idle Configuration
      lazy = {
        -- Change default idle icon for 'pastel' theme to a keyboard icon
        icon = require('cord.api.icon').get('keyboard'),
        -- Alternatively, use an idle icon from the 'onyx' theme
        -- icon = require('cord.api.icon').get('idle', 'onyx'),

        -- 📝 Text Configuration
        text = {
                 workspace = function(opts)
          return string.format('In workspace: %s', opts.workspace or 'unknown')
        end, -- Text shown when in a workspace
        viewing = function(opts)
          return string.format('Viewing %s', opts.filename or 'unknown file')
        end, -- Text shown when viewing a file
        editing = function(opts)
          return string.format('Editing %s - Line %s, Char %s', opts.filename, opts.cursor_line, opts.cursor_char)
        end, -- Text shown when editing a file
        file_browser = 'Browsing files in {name}', -- Text for file browser
        plugin_manager = 'Managing plugins in {name}', -- Text for plugin manager
        lsp = 'Configuring LSP in {name}', -- Text for LSP manager
        docs = 'Reading {name}', -- Text for documentation
        vcs = 'Committing changes in {name}', -- Text for VCS buffer
        notes = 'Taking notes in {name}', -- Text for notes buffer
        debug = 'Debugging in {name}', -- Text for debugging
        test = 'Testing in {name}', -- Text for test-related buffers
        diagnostics = 'Fixing problems in {name}', -- Text for diagnostics buffers
        games = 'Playing {name}', -- Text for game buffers
        terminal = 'Running commands in {name}', -- Text for terminal buffers
        dashboard = 'Home', -- Text for dashboard 
        },
      },

      -- 🎨 Editor Configuration
      editor = {
        client = 'vim', -- Identify the client as 'neovim'
        tooltip = 'The Inferior Text Editor', -- Tooltip for the editor icon
      },

      -- ⏰ Timestamp Configuration
      timestamp = {
        enabled = true, -- Enable timestamps in presence
        reset_on_idle = false, -- Don't reset the timestamp when idle
        reset_on_change = false, -- Reset the timestamp when presence changes
      },



            idle = {
        enabled = true, -- Enable idle status detection
        timeout = 300000, -- 5 minutes before marking the session as idle
        show_status = true, -- Show idle status in presence
        ignore_focus = false, -- Only show idle if Neovim loses focus
        unidle_on_focus = true, -- Unidle the session when Neovim gains focus
        smart_idle = true, -- Enable smart idle feature
        details = function(opts)
          return string.format('Idling in %s', opts.workspace or 'unknown workspace')
        end, -- Custom idle details text
        state = function(opts)
          return string.format('Idle for %d minutes', math.floor(opts.idle_time / 60000))
        end, -- Custom idle state
        tooltip = '💤 Taking a break...', -- Tooltip for idle icon
        icon = function()
          return require('cord.api.icon').get('idle', 'pastel') -- Use idle icon from 'pastel' theme
        end,
      },


      -- 🧩 Variables (Optional for Advanced Customization)
      variables = {
        project_name = function()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ':t') -- Dynamically fetch the current project name
        end,
      },

      -- 🪝 Hooks Configuration
      hooks = {
        ready = function(manager)
          print('Cord is ready to sync with Discord!')
        end,
        idle_enter = function(opts)
          print('Idle state detected')
        end,
        idle_leave = function(opts)
          print('Exiting idle state')
        end,
      },
    }
  end,
}

