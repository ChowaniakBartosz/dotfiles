stty stop undef # disable ctrl+s to freeze terminal, must be before p10k not to throw error messages

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#!/bin/sh

# basics
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
zle_highlight=('paste:none') # dont highlight pasted text
unsetopt BEEP # disable beeping
autoload -Uz colors && colors # colors in terminal

## prompt with git status
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable git 
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
#+vi-git-untracked(){
#    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
#        git status --porcelain | grep '??' &> /dev/null ; then
#        hook_com[staged]+='!' # signify new files with a bang
#    fi
#}
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"
#PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b"
##PROMPT="%{$fg[magenta]%}%~%{$fg[red]%}/ %{$reset_color%}$%b"
#PROMPT+="\$vcs_info_msg_0_ " # append git status

# zsh history cache
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# autocompletions with tab
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit # necessary. turns on autocompletions?
_comp_options+=(globdots) # include hidden files in autocompetions

# vi mode
bindkey -v # probably set keybinding to vim, it's a built keybind configuration in zsh
export KEYTIMEOUT=1
# use vim keys in autocomplete menu
bindkey -M menuselect 'j' vi-down-line-or-history # -M means probably ALT key modifier. not really, it works without a modifier
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char # backspace?
# change cursor for different vi modes
function zle-keymap-select () {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q';; # block
    viins|main) echo -ne '\e[5 q';; # beam
  esac
  
}
zle -N zle-keymap-select
# use beam shaped cursor at startup
function zle-line-init() {
  zle -K viins # initiate vi insert
  echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' } # use beam shape for each new prompt
# edit line in vim with ctrl+e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line
# DELETE key without any modifiers
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M visual '^[[P' vi-delete
bindkey '^[[P' delete-char

# Extra plugins

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "Aloxaf/fzf-tab"
plug "Amir1453/zsh-auto-dunstify"
plug "zdharma-continuum/fast-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/fzf"
#plug "romkatv/powerlevel10k"
plug "kutsan/zsh-system-clipboard"
plug "hlissner/zsh-autopair"

# probably fish string search related
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[k' history-substring-search-up # or '\eOA'
bindkey '^[j' history-substring-search-down # or '\eOB'
#bindkey '^[[A' history-substring-search-up # or '\eOA'
#bindkey '^[[B' history-substring-search-down # or '\eOB'

# exports
# vim mode
# Aliases
alias stow="stow --target=$HOME"
alias rm="rm -i"
alias ls="ls --color=auto"
alias ll="eza -la --icons=auto"
alias neofetch="fastfetch"
alias lf="lfub"
alias g="lazygit"
alias tn="tmux new -s Session"
alias ta="tmux attach"
alias td="tmux detach"
alias tl="tmux ls"

export TMUX_PLUGIN_MANAGER_PATH="$HOME/.config/tmux/plugins/"
# plugins
# bindings

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
#[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
eval "$(starship init zsh)"
