# ============== My aliases =================
alias c=clear
alias sl=ls
alias ks=ls
alias lg=lazygit

# ============= Adding path to load all my binaries ================
export PATH=$PATH:/home/$USER/perso/bin


# =========== ZSH suggestions ==================
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ============ Starship =============
eval "$(starship init zsh)"

#=========== Command to execute everytime zsh is launched ==================
clear
