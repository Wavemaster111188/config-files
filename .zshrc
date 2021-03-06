
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit


# Locize install
export locize_INSTALL="/Users/kevin.deffke/.locize-cli"
export PATH="$locize_INSTALL/bin:$PATH"


# better search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end


# git aliases
alias co='git co'
alias st='git st'
alias lga='git lga'
alias br='git br'
alias ci='git ci -m'
alias unstage='git unstage'
alias last='git last'
alias addp='git addp'
alias lg='git lg'
alias pull='git restore humery.xcworkspace/xcshareddata/swiftpm/Package.resolved; git pull'
alias push='git push'
alias pushf='git push --force-with-lease'
alias pushu='git push --set-upstream origin HEAD'
alias rebase='git rebase'
alias rb='git rebase'
alias mergetool='git mergetool'
alias stash='git stash save'
alias stashlist='git stash list'
alias pop='git stash pop'
alias diff='git diff'
alias diffs='git diffs'

# git functions

function getCurrentTicket {
    echo $(git symbolic-ref --short -q HEAD | sed -n 's/.*\(APP-[0-9]*\)-.*/\1/p')
}
function cim {
    ticket=$(getCurrentTicket)
    ci "$ticket $*"
}
function rbm {
    local branch="${1:-main}"
    git fetch
    git rebase origin/$branch 
}
function rbmF {
    local branch="${1:-main}"
    git fetch
    git rebase origin/$branch
    pushf
}

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
