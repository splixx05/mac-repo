return {

    'MeanderingProgrammer/dashboard.nvim',
    event = 'VimEnter',
    dependencies = {
        { 'MaximilianLloyd/ascii.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },
    },
    config = function()
        require('dashboard').setup({
-- Dashboard header
    
   
    header = {
	[[                                                                                                   ]],
	[[ /\\\\\     /\\\                               /\\\        /\\\                                    ]],
	[[ \/\\\\\\   \/\\\                              \/\\\       \/\\\                                   ]],
	[[  \/\\\/\\\  \/\\\                              \//\\\      /\\\   /\\\                            ]],
	[[   \/\\\//\\\ \/\\\     /\\\\\\\\      /\\\\\     \//\\\    /\\\   \///     /\\\\\  /\\\\\         ]],
	[[    \/\\\\//\\\\/\\\   /\\\/  /\\\\   /\\\///\\\    \//\\\  /\\\     /\\\  /\\\///\\\\\///\\\      ]],
	[[     \/\\\ \//\\\/\\\  /\\\\  \/\\\   /\\\  \//\\\    \//\\\/\\\     \/\\\ \/\\\ \//\\\  \/\\\     ]],
	[[      \/\\\  \//\\\\\\ \//\\///////   \//\\\  /\\\      \//\\\\\      \/\\\ \/\\\  \/\\\  \/\\\    ]],
	[[       \/\\\   \//\\\\\  \//\\\\\\\\\\  \///\\\\\/        \//\\\       \/\\\ \/\\\  \/\\\  \/\\\   ]],
	[[        \///     \/////    \//////////     \/////           \///        \///  \///   \///   \///   ]],
	[[                                                                                                   ]],
},
    -- Format to display date in
    date_format = '%Y-%m-%d %H:%M:%S',
    -- List of directory paths, or functions that return paths
    directories = {
        '/home/ricky/',
        '~/.config',
        '~/.config/nvim/lua',
        '~/.config/alacritty',
        '~/.config/conky',
        '~/.zshrc',
        '~/.wezterm.lua',
      },
    -- Sections to add at bottom, these can be string references to
    -- functions in sections.lua, custom strings, or custom functions
    footer = {
        '"Intelligence is the ability to avoid work, while ensuring that the work gets done." - Linus Torvalds'
      },
    -- Gets called after directory is changed and is provided with the
    -- directory path as an argument
    on_load = function(path)
        -- Do nothing
    end,
    -- Highlight groups to use for various components
    highlight_groups = {
        header = 'Constant',
        icon = 'Type',
        directory = 'Delimiter',
        hotkey = 'Statement',
    },
    })
    end,
}
