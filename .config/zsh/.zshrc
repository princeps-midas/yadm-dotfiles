# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# autosugggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
bindkey '^[' autosuggest-toggle

# syntax highlighting
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

PROMPT='%n@%m %1~$ '

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

alias sudo="sudo "
# alias hx="hx -c ~/.config/term-df/helix/config.toml"
alias ff="fastfetch"
# alias btop="btop -c ~/.config/term-df/btop/btop.conf"
# alias z="zoxide"

if command -v fastfetch >/dev/null; then
  clear && ff
fi

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# The following lines were added by compinstall
zstyle :compinstall filename '/home/nic/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PATH="$HOME/.cargo/bin:$PATH"
