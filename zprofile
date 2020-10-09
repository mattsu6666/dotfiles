autoload -U promptinit
promptinit
PROMPT='%n:%c'

###
# lsコマンドの設定
##
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -A'
export LSCOLORS=gxfxcxdxbxegedabagacad

###
# for mac
##
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "11.0.8"`
PATH=${JAVA_HOME}/bin:${PATH}
PATH=${HOME}/.embulk/bin:${PATH}
PATH=$HOME/.nodebrew/current/bin:${PATH}
#PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

export SBT_OPTS="-Dfile.encoding=UTF8 -Xmx4G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M  -Duser.timezone=JST"

###
# gitのタブ補完
##
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n:%c${vcs_info_msg_0_}$ '

###
# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

#pecoでhistory検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=100000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=1000000

# 重複を記録しない
setopt hist_ignore_dups

# 重複するコマンドは古い方を削除する
setopt hist_ignore_all_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# ghq
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

###
# zsh completion
##
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

autoload -U compinit
compinit
