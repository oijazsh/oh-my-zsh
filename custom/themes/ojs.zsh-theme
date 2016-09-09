function _virtualenv_prompt_info {
    [[ -n $(whence virtualenv_prompt_info) ]] && virtualenv_prompt_info
}

function _git_prompt_info {
    echo $(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/(\1)/')
}

function _pyenv_prompt_info {
    [[ -n $(whence pyenv_prompt_info) ]] && \
        [[ "$(pyenv_prompt_info)" != "${PYENV_PROMPT_DEFAULT_VERSION}" ]] && \
	  [[ -n "$(_virtualenv_prompt_info)" ]] && \
	  echo "${ZSH_THEME_PYENV_PROMPT_PREFIX}$(pyenv_prompt_info)${ZSH_THEME_PYENV_PROMPT_SUFFIX}"
}

local left_ret_status="%(?:%{$fg_bold[green]%}>:%{$fg_bold[red]%}>%s)"
local time="%{$fg_bold[white]%}⌚%t"

PROMPT='${left_ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%~%{$fg_bold[blue]%}$(_git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
RPROMPT='$(_virtualenv_prompt_info)$(_pyenv_prompt_info) ${time}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg_bold[green]%}{"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=":"
ZSH_THEME_PYENV_PROMPT_SUFFIX="}%{$reset_color%}"
