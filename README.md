# About
Backup configuration for my wezterm terminal, my zsh configurations and nvim

## ZSH Terminal
Copy the zshrc file as a hidden file in your home directory.

Copy the folder zsh/ in your home directory as a hidden folder. This will contain all your plugins.
You could find a shell file that get the command to install the plugins I am using.

Example of plugins:

Auto suggestion: let the terminal remember your last command and show a ghost text if the user input match the cmd

    git clone https://github.com/zsh-users/zsh-autosuggestions

Highligh command: let the terminal show you if the actual command works. If the command is red, it does not, but if it's green, it's working !

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

## Wezterm
Copy the folder "wezterm" inside the folder /home/$USER/.config/

Get a font. Download your font, and put it inside  /home/$USER/.local/share/fonts/

Use the nerd font to get all the symbols and put it inside settings.lua.

In the folder color.lua, change the background image path to your image, if no need, delete or comment the code

Make sure to have the necessary binary:

    - wezterm
    - starship
    

## Nvim
Copy the folder "nvim"  inside the folder /home/$USER/.config

Make sure to have the necessary binary:

    - nvim
    - rg (ripgrep)
    - lazygit
