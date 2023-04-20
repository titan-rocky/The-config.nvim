local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local report = require('weather')

-- Set header
dashboard.section.header.val = {
[[                        ██████                                                                                  ]],
[[                     ████░░░░░░██                                                                               ]],
[[                 ████░░░░░░░░▒▒██                                                                               ]],
[[               ██░░░░░░░░░░░░▒▒██  ██████                                                                       ]],
[[               ██░░░░░░▒▒██▒▒▒▒████░░░░░░██                                                                     ]],
[[                 ██░░░░▒▒██▒▒██░░░░░░░░░░██                                                                     ]],
[[               ████████░░▒▒▒▒██░░▒▒▒▒░░░░██                                                                     ]],
[[           ████░░░░░░██░░▒▒██░░░░████░░░░████           ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗      ]],
[[         ██░░░░░░▒▒▒▒░░██████░░░░░░░░░░░░▒▒██           ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      ]],
[[       ██░░░░▒▒████░░▒▒██████▒▒▒▒▒▒▒▒▒▒▒▒██             ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      ]],
[[         ██░░░░██░░░░▒▒▒▒██░░░░████████████             ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      ]],
[[           ██░░░░░░░░▒▒██░░░░░░░░░░██                   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║      ]],
[[             ██░░▒▒▒▒▒▒██░░░░░░░░░░░░██                 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝      ]],
[[             ██████████░░░░▒▒██░░░░░░░░██                                                                       ]],
[[                   ████░░░░▒▒██░░░░░░▒▒██                                                                       ]],
[[                   ██████░░░░░░░░▒▒▒▒▒▒██                                                                       ]],
[[                 ████  ██▒▒▒▒▒▒▒▒▒▒████                                                                         ]],
[[               ████      ██████████                                                                             ]],
[[                                                                                                                ]],
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    --dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```

local function footer()
    -- Number of plugins
    --local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date "󰃭 %d-%m-%Y   %H:%M:%S  " .. report.kfeed
    local plugins_text = datetime .. "  "
    mg={plugins_text,[[]],[[     "The supreme art of war is to subdue the enemy without fighting.”]],[[     ―Sun Tzu, The Art of War]],[[]],[[]],[[                     Just a config of alpha.nvim]]}
    return {"",datetime}
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Function"
dashboard.section.buttons.opts.hl_shortcut = "Type"
dashboard.opts.opts.noautocmd = true

-- Send config to alpha
alpha.setup(dashboard.opts)
-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
