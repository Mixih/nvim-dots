# Neovim 0.7.0+ configuration files

Personal config that leverages the lua-based configuration for flexibility.

## Features

* Declarative config utilities with carefully controlled load order.
* Automatically bootstraps the plugin manager on first load. No more having to grab the
    commands from the packer repo when setting up a new computer.
* Diagnostics reported as squiggles in compliant terminals (Alacritty 0.11, Kitty, gnome
    terminals)

## Usage

1. Clone this repo somewhere safe
2. Symbolic link ``~/.config/nvim`` to this repo. If porting from an existing config,
   `~/.local/share/nvim` should be cleared to prevent conflicts.
3. Start neovim. The first load should automatically bootstrap the plugins. Neovim should
   be restarted once packer is done downloading and configuring the plugins.
