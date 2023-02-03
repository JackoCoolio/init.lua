# Installation
1. `cd ~/.config`
2. `git clone https://github.com/jackocoolio/init.lua nvim`
3. Install packer.nvim
4. `nvim ./lua/jackocoolio/packer.lua` and run `:so`. If a packer window doesn't
open automatically, run `:PackerSync`

# Dependencies
## ripgrep
Required for `:Telescope live_grep`.
## cmake
Required for `telescope_fzf_native`, but I've encountered some issues with getting it to work, so I've disabled it.
## lazygit
Required for the <kbd>\<leader\></kbd><kbd>g</kbd><kbd>s</kbd> mapping to work.
