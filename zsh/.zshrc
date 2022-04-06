# Lines configured by zsh-newuser-install
HISTFILE=~/.zshhistory
HISTSIZE=1000
SAVEHIST=5000
export EDITOR=nvim
export PATH="$PATH:/usr/local/go/bin:/home/emil/.local/bin"
setopt autocd notify
unsetopt beep extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/emil/.zshrc'
autoload -Uz compinit
# End of lines added by compinstall
source ~/.zplug/init.zsh
source ~/.git-prompt.sh
source ~/.aliases.zsh
zplug "junegunn/fzf"
compinit
source ~/.zshtheme.zsh

export PATH="$HOME/.poetry/bin:$PATH"
