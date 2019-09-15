# Setup fzf
# ---------
if [[ ! "$PATH" == */home/schlowmo/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/schlowmo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/schlowmo/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/schlowmo/.fzf/shell/key-bindings.bash"
