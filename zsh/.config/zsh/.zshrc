# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# for creating zsh process and starting program in init
# zsh -is eval 'your shell command here'
if [[ $1 == eval ]]
then
    "$@"
set --
fi
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
([[ -n ${TTY:-} && $+commands[stty] == 1 ]] && stty -ixon <$TTY >$TTY) > /dev/null 2>&1
# History in cache directory:
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
#HISTTIMEFORMAT="[%F %T] "
#add timestamp for each entry
setopt EXTENDED_HISTORY
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
fpath+=~/.config/zsh/.zfunc
compinit
_comp_options+=(globdots)		# Include hidden files.

# zle will use vi mode
bindkey -v
export KEYTIMEOUT=1
# alacritty
bindkey  "^[[H"		beginning-of-line
bindkey  "^[[F"   	end-of-line
bindkey  "^[[3~"  	delete-char
bindkey  "^[[1~"  	beginning-of-line
bindkey  "^[[4~"  	end-of-line
bindkey  -M vicmd "^[[H"	beginning-of-line
bindkey  -M vicmd "^[[F"   	end-of-line
bindkey  -M vicmd "^[[1~"  	beginning-of-line
bindkey  -M vicmd "^[[4~"  	end-of-line
bindkey  -M vicmd "^[[3~"  	delete-char
# kitty
bindkey  -s "^[[1;3H" "^[[H"	 
bindkey  -s "^[[1;3F" "^[[F"  
bindkey  -s "^[[3;3~" "^[[3~" 
bindkey  -s "^[[1;3C" "^[[C"
bindkey  -s "^[[1;3D" "^[[D"
bindkey  -s "^[[1;3B" "^[[B" #down
bindkey  -s "^[[1;3A" "^[[A"  #up
bindkey  -M vicmd -s "^[[1;3H" "^[[H"
bindkey  -M vicmd -s "^[[1;3F" "^[[F" 
bindkey  -M vicmd -s "^[[3;3~" "^[[3~"
bindkey  -M vicmd -s "^[[1;3C" "^[[C"
bindkey  -M vicmd -s "^[[1;3D" "^[[D"
bindkey  -M vicmd -s "^[[1;3B" "^[[B" #down
bindkey  -M vicmd -s "^[[1;3A" "^[[A"  #up
export EDITOR='nvim'
export BROWSER='vivaldi-snapshot'
export VISUAL='nvim'
export LC_ALL='en_US.UTF-8'
export ZSH_TMUX_FORCEUTF8=true
export SUDO_ASKPASS=${HOME}/.local/bin/rofi_pass
export GOPATH=${HOME}/proj/go

export tNavigator_INTERNALS_CHECK_RESTART=yes

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
		[[ $1 = 'block' ]]; then
			echo -ne '\e[1 q'
		elif [[ ${KEYMAP} == main ]] ||
			[[ ${KEYMAP} == viins ]] ||
			[[ ${KEYMAP} = '' ]] ||
			[[ $1 = 'beam' ]]; then
					echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}
zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp" >/dev/null
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
#bindkey -s '^o' 'lfcd\n'

#bindkey -s '^a' 'bc -l\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
#zle -N fzf-completion-widget
#bindkey '^I' fzf-completion-widget

bindkey '^[[P' delete-char
if [[ -n $TMUX ]]; then
	export NVIM_LISTEN_ADDRESS=/tmp/nvim_$USER_`tmux display -p "#{window_id}"`
fi
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# zsh parameter completion for the dotnet CLI

_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

source ~/.config/zsh/zinit/zinit.zsh
zinit light romkatv/powerlevel10k
zinit light qblays/fzf-tab
zinit light zdharma/fast-syntax-highlighting
#zinit load marlonrichert/zsh-autocomplete
zinit wait lucid for \
	atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
	blockf \
	zsh-users/zsh-completions \
	blockf \
	kutsan/zsh-system-clipboard \
	blockf \
	skywind3000/z.lua \
	atload"!_zsh_autosuggest_start" \
	zsh-users/zsh-autosuggestions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
#zstyle ':fzf-tab:*' fzf-flags '--height 100%'
source /home/gorm/.config/broot/launcher/bash/br 2> /dev/null

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
#source "$HOME/.config/zsh/theme.zsh"
