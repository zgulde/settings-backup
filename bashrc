source ~/.env
source ~/.aliases
source ~/.bash_functions

PATH=/bin
PATH=/sbin:$PATH
PATH=/usr/bin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/local/bin:$PATH # put homebrew before the mac stuff
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
PATH=$HOME/scripts:$PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/opt/bin:$PATH
PATH=node_modules/.bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$HOME/.opam/system/bin:$PATH

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH
export EDITOR=nvim
export VISUAL=nvim
export GOPATH=$HOME/go
export FZF_DEFAULT_OPTS='--reverse'
export HISTSIZE=
export HISTFILESIZE=
export HISTIGNORE='ls:clear:ll:la:ltr:latr:exit'
# Seems this is necessary for java9, specifically running spring applications.
# This module used to be included by default, but no longer is. See
# https://stackoverflow.com/questions/12525288/is-there-a-way-to-pass-jvm-args-via-command-line-to-maven
# and http://maven.apache.org/configure.html
# basically this is an extra option maven passes to `java`
# export MAVEN_OPTS='--add-modules java.xml.bind'


# readline
shopt -s autocd
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "set blink-matching-paren on"
bind "set colored-completion-prefix on"
bind "set colored-stats on"
bind "set completion-query-items 50"

# if we're on macos...
if [[ $(uname -s) == "Darwin" ]]; then
    # pass tab completion
    source /usr/local/Cellar/pass/1.7.1/etc/bash_completion.d/pass
    # taskwarrior tab completion
    # source /usr/local/Cellar/task/2.5.1/etc/bash_completion.d/task.sh
    # complete -o nospace -F _task t
    # complete -o nospace -F _task tw
fi

eval "$(pandoc --bash-completion)"

reset='\[\e[0m\]'
red='\[\e[0;31m\]'
green='\[\e[0;32m\]'
yellow='\[\e[0;33m\]'
blue='\[\e[0;34m\]'
purple='\[\e[0;35m\]'
cyan='\[\e[0;36m\]'

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local last_exit_code=$?
    PS1=

    # # small prompt
    # PS1="${blue}\W${reset}"
    # # PS1="$PS1 ${yellow}\`minimal_git_status\`${reset}"
    # if [[ $last_exit_code -ne 0 ]]; then
    #     PS1="$PS1 ${red}${last_exit_code}${reset}"
    # fi
    # PS1="$PS1 > ${reset}"

    # for some reason virtualenv doesn't like my prompt
    if [[ -n $VIRTUAL_ENV ]]; then
        PS1="$PS1($(basename $VIRTUAL_ENV)) "
    fi
    PS1="$PS1[${cyan}\u${reset}@${green}\h${reset}]"
    PS1="$PS1(${blue}\w${reset})"
    PS1="$PS1${yellow}\`parse_git_branch\`"
    PS1="$PS1${reset}\n"
    if [[ $last_exit_code -ne 0 ]]; then
        PS1="$PS1 ${red}$last_exit_code"
    fi
    PS1="$PS1${reset} % "

}

eval "$(myserver bash-completion)"

# OPAM configuration
# eval `opam config env`
# source /Users/zach/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
