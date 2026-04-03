# Created by newuser for 5.8.1

# ============= My variables ===============


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

# ========== fnm package manager to use node last version instead of the old default one ===========
FNM_PATH="/home/aelison/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi

# ================ use node 22 from fnm instead of the default one ==============
echo 'eval "$(fnm env --use-on-cd)"' >> ~/.zshrc
eval "$(fnm env --use-on-cd)"
eval "$(fnm env --use-on-cd)"
