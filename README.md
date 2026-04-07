# About
Backup configuration for my wezterminal and nvim

## ZSH Terminal
Copy the zshrc file as a hidden file in your home directory
Create a folder .zsh/ in your home directory that will contain all your plugins

## Wezterm
Copy the folder "wezterm" inside the folder /home/$USER/.config/
In the folder color.lua => change the background image path to your image, if no need, delete or comment the code

Make sure to have the necessary binary:

    - wezterm
    - starship

Also get the font. Download your font, and put it inside  /home/$USER/.local/share/fonts/
Use the nerd font for all the symbols and put it inside settings.lua
    

## Nvim
Copy the folder "nvim"  inside the folder /home/$USER/.config
Make sure to have the necessary binary:

    - nvim
    - rg (ripgrep)
    - lazygit
