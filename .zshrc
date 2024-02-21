
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/tomiguez/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd nomatch notify
unsetopt beep extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

export ZSH="/usr/share/oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
	dirhistory
	git
	ssh-agent
	zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# Allow [ or ] wherever you want
unsetopt nomatch

export VISUAL=nvim
export EDITOR="$VISUAL"

export BROWSER="firefox"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"

source ~/.aliases

eval "$(starship init zsh)"
source /usr/share/nvm/init-nvm.sh
