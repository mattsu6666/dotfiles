PROMPT='%n:%~$ '

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

export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}
PATH=${HOME}/.embulk/bin:${PATH}
PATH=$HOME/.nodebrew/current/bin:${PATH}
#PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

export SBT_OPTS="-Dfile.encoding=UTF8 -Xmx1536M -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M  -Duser.timezone=JST"

###
# gitのタブ補完
##
source /usr/local/etc/bash_completion.d/git-completion.bash

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
