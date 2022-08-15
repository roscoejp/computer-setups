# Made to emulate my normal Mac term
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}'
    local user_symbol='#'
else
    local user='%{$terminfo[bold]$fg[blue]%}%n%{$reset_color%}'
    local user_symbol='$'
fi

local host='%{$terminfo[bold]$fg[green]%}%m%{$reset_color%}'

local current_dir='%{$terminfo[bold]$fg[yellow]%}%30<...<%~%<< $reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user} ${host} ${current_dir} ${rvm_ruby} ${git_branch}
╰─%B${user_symbol}%b "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
