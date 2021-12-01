# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/marc/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  zsh-autosuggestions
  z
  dirhistory
)
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias vi="nvim"
alias showc='echo "\x1B[?25h"'
alias ctags="`brew --prefix`/bin/ctags"

POWERLEVEL10K_MODE='nerdfont-complete'
POWERLEVEL10K_PROMPT_ON_NEWLINE=true
POWERLEVEL10K_RPROMPT_ON_NEWLINE=true
POWERLEVEL10K_SHORTEN_STRATEGY='truncate_to_last'
POWERLEVEL10K_CONTEXT_TEMPLATE=''

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
