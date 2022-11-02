autoload -Uz vcs_info
autoload -Uz colors && colors

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' (%b)'

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=''
    EXIT_CODE_PROMPT+="$fg[red][$fg_bold[red]$LAST_EXIT_CODE$fg_no_bold[red]]$reset_color"
    echo "$EXIT_CODE_PROMPT"
  fi
}

PROMPT=''
PROMPT+='$fg[magenta]%n$reset_color@%m '
PROMPT+='$fg[magenta]%~$reset_color'
PROMPT+='${vcs_info_msg_0_} $(check_last_exit_code)$ '
