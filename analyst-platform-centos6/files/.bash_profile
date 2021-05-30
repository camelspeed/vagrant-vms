alias la="ls -al"
alias ll="ls -l"

# Git Bash Helpers
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
