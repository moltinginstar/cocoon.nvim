# cocoon.nvim

My personal collection of Neovim plugins.

## Installation

1. Clone the repository into your Neovim configuration directory:
  
   ```sh
   git clone https://github.com/moltinginstar/cocoon.nvim ~/.config/nvim/pack/cocoon/start/cocoon.nvim
   ```

2. Add the following line to your `init.lua` file for each plugin you want to enable:

   ```lua
   require("cocoon.<plugin-name>").setup()
   ```

## Plugins

- [`multishift`](readmes/multishift.md): Multilevel indentation in normal mode.

## License

All code in this repository is licensed under the same terms as Neovim itself. See `:help license` for more information.

