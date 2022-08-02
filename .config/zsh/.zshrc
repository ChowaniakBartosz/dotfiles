# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.cache/zsh/history"

# some useful options (man zshoptions)
setopt autocd # if typed text is not command, cds into specified directory
setopt extendedglob # dunno
setopt nomatch # dunno
setopt menucomplete # selects first option on tab autocomplete

setopt interactive_comments # dunno
stty stop undef	# Disables ctrl-s to freeze terminal.
zle_highlight=('paste:none') # disables highlighting pasted text

# beeping is annoying
unsetopt BEEP # disable beeping

# completions
autoload -Uz compinit # dunno
zstyle ':completion:*' menu select # dunno
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist # dunno
# compinit
_comp_options+=(globdots)		# dunno. Include hidden files.

autoload -U up-line-or-beginning-search # dunno
autoload -U down-line-or-beginning-search # dunno
zle -N up-line-or-beginning-search # dunno
zle -N down-line-or-beginning-search # dunno

# Ny custom functions to manage plugins
source "$ZDOTDIR/zsh-functions"

# Colors
autoload -Uz colors && colors # dunno

# Enable colors and change prompt:
autoload -U colors && colors	# dunno. Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b " # Customize command prompt

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shell/shortcutrc" ] && source "$HOME/.config/shell/shortcutrc"
[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"
[ -f "$HOME/.config/shell/zshnameddirrc" ] && source "$HOME/.config/shell/zshnameddirrc"

# Vim edit line mode CTRL+e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load plugins using custom functions
zsh_add_plugin "romkatv/powerlevel10k"
zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"

# Load additional files
zsh_add_file "zsh-vim-mode"

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
