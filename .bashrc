#>>> Custom Terminal prompt
# Load the git prompt script if exists - otherwise get it!
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
else
  echo "Getting Git prompt script...."
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
  source ~/.git-prompt.sh
fi
#<<<
 
#>>> Git autocomplete on Tab
# Get the script in home folder first - otherwise download it!:
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
else
  echo "Getting Git tab completion script..."
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
  . ~/.git-completion.bash
fi
#<<<
 
 # Show unstaged (*) and staged (+) changes in the prompt string
export GIT_PS1_SHOWDIRTYSTATE=1
 
# Color the prompt string and add git info
export PS1=${CONDA_PROMPT_MODIFIER}'\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[33m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '
 
# TAB completion configuration
# TAB completion ignores case
bind "set completion-ignore-case on"
# Require only one instead of two TAB presses before showing matches
bind "set show-all-if-ambiguous on"
# If there are multiple matches for completion, cycle through them with TAB
bind 'TAB':menu-complete
# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"
 
# History configuration
# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
# Append to the history file, don't overwrite it.
shopt -s histappend
# Write commands to history one-by-one right after they are executed
# instead of all together when the terminal is closed.
# Make new terminals see all commands run in currently open terminals and
# prepend a newline to the prompt string to separate it from the last command's output
PROMPT_COMMAND='history -a; echo'
# Increase history size
HISTSIZE=50000
HISTFILESIZE=50000
 
# Aliases and functions -----> Personal Preference!---------------------
# Note that aliases only are in effect when you are using the shell interactively
# (e.g. opening the terminal and typing or pasting commands).
# If you run a bash script or makefile,
# the original command is used instead of your alias.
# ---
# Some common operations
alias l='ls -lthAF --color'
alias jl='jupyter lab'
alias ca='conda activate'
alias cda='conda deactivate'
 
# Git helpers
alias gl='git log --date short -10 --pretty=format:"%C(auto,yellow)%h %C(auto,blue)%ad%C(auto)%d %C(auto,reset)%s"'
alias gt='git status'
alias gm='git commit -m'
alias gap='git add -p'
# Use git inner workings to allow autocomplete of branches with an alias
alias gco='git checkout'
__git_complete gco _git_checkout
 
# Move, remove, and copy show what was done and prompt before overwriting files.
alias rm="rm -vI"
alias mv="mv -vi"
alias cp="cp -vi"
alias mkdir="mkdir -vp"
# Case insensitive grep by default and color matches
alias grep='grep -i --color=auto'