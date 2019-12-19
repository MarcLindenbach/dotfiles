export ZSH="/Users/marc/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  zsh-autosuggestions
  z
  dirhistory
)
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias showc='echo "\x1B[?25h"'
alias ctags="`brew --prefix`/bin/ctags"

POWERLEVEL9K_MODE='nerdfont-complete'
source  ~/source/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_to_last'
POWERLEVEL9K_CONTEXT_TEMPLATE=''

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/marc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/marc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/marc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/marc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=~/Library/Python/3.6/bin:$PATH

unsetopt sharehistory

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/marc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/marc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
# eval $(thefuck --alias)
