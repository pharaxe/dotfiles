# Path to your oh-my-zsh installation.
export ZSH="/Users/bensweedler/.oh-my-zsh"

# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf
export DISABLE_FZF_AUTO_COMPLETION="true"
export ZSH_THEME="common"

export PATH=/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/lib64/java/bin:/usr/games:$PATH
[ -d ~/bin ] && export PATH=~/bin:$PATH


# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf)

bindkey -v
bindkey '^R' history-incremental-search-backward
##################################################################################################################
## Base ".env" file - Add overrides to ".env.overrides" and use "npm run gen-env" to configure
## your environment.  Any time you make changes to ".env" you need to stop & restart the web server.
##
## PLEASE keep this base.env file up-to-date with any ENV variables that need to be configured to run the app!
##
## All of these should be consumed by "server/config.js".
##################################################################################################################

#########################
## Standard Node stuff
#########################
# development | production
NODE_ENV="development"
VERSION="0.0.1"

#########################
## Standard App Config
#########################
# DEBUG|RELEASE     - determines whether builds should be optimized or not
BUILD_MODE="DEBUG"

# DEBUG|RELEASE     - mode for running app code
RUN_MODE="DEBUG"

# LOCAL|DEV|TEST|SALES|DEMO|US-PROD|etc... - tells exactly the name of the environment
ENV_NAME="LOCAL"
# LOCAL|DEV|PROD    - helps understand whether to use "real" external services (like an email service)
ENV_TYPE="LOCAL"
LOG_LEVEL="debug"
SECURE=false

#TRACING           - determines if tracing is wanted or not
TRACING="false"

# The env URL where the APP runs
APP_URL="http://localhost:1904"

ENVIRONMENT_LOCATION="US"

#########################
## Authorization
#########################
AUTH_CLIENT_ID="gb"
# AUTH_CLIENT_SIGNATURE comes from jwtRS256.key.pub from gb-auth. If this does not match that public key, you will run into authentication issues
AUTH_CLIENT_SIGNATURE="LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF5Rzg5blZ0Ulgrakk4SHl2UitJMgpKd2F6eHRjbzc1czAwN0Jaa2NMZTRvZTNkdno2eCtySk8rYU1RN3lvNk0wNGx3NjEwaXdWQUJqL25YL1RpSWliCjV3Skx5aVBjU3RLd0ZTdFFIUVhOZlczZHVFdU9CeGRxMVExbDdCalJmK1kyT2lLcEVuT3ZJbGFFMWRqc2xWbWUKVmplOW5XVXhBZkVEMlJEOEhublc1WkRlOUhiMVVLSVRKYVJMZExwaG9jNUh5c1pKUU5pbTdpNmhjZkU4SURjeAoyVm5ZODFickxTV2tDeEFMTlo4cGpJRDRYNTV0RjJUazhaV0wya3BIV2RoTEszUnVGd2tGR3VabFFsVk5Xbm9VClYrY0swOTR6bDZlam8wNENXRWJmbm45SVV4bDk4SmVSOHBaK3QrTnNaK09hSGdNSThaMXk3aUloNTFTa3p5YnUKWndJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0tCg=="
AUTH_ISSUER="gb-auth"


#########################
export NVM_DIR="${HOME}/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc

export DENO_INSTALL="/Users/bensweedler/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Continue on to my base bashrc and other rc files
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.profile

load-nvmrc

g_rbi() {
  git rebase -i HEAD~“$1”
}

export PATH="$HOME/.poetry/bin:$PATH"

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1
VENV="\$(virtualenv_info)";

export PS1="${VENV}${PS1}"

export PATH="$HOME/.poetry/bin:$PATH"

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
   export TERM='xterm-256color'
else
   export TERM='xterm-color'
fi

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# -----------------------------------------------------------------------------
#          FILE: smt-mod.zsh-theme
#   DESCRIPTION: oh-my-zsh theme file, based on smt by Stephen Tudor
#        AUTHOR: Brock Angelo
#       VERSION: 0.1
#    SCREENSHOT:
# -----------------------------------------------------------------------------

MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} 💩 %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[red]%} 🚀 %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} 👍 %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[yellow]%} 📦 " # staged
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[green]%} 📝 " # modified
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} 📛 " # deleted
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} 👯 " # renamed
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} 🚔 " # unmerged
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} 🙈 " # untracked

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

function prompt_char() {
  git branch >/dev/null 2>/dev/null && echo "%{$fg[green]%} ❯ %{$reset_color%}" && return
  hg root >/dev/null 2>/dev/null && echo "%{$fg_bold[red]%}☿%{$reset_color%}" && return
  echo "%{$fg[green]%}❯ %{$reset_color%}"
}

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[cyan]%}"

# Get Node version
function node_version() {
  NVM_VERSION=$(echo $NVM_BIN | grep -oE '\d+\.\d+\.\d+')
  echo $NVM_VERSION
}

# Get Python version
function python_version() {
	PYTHON_VERSION=$(pyenv version | awk {'print $1'})
	echo $PYTHON_VERSION
}

# Is gb-auth running?
function is_auth_running() {
	AUTH_PID=$(test -f ~/Library/Application\ Support/gbcli/pids/gb-auth.pid && cat ~/Library/Application\ Support/gbcli/pids/gb-auth.pid)
	test $AUTH_PID && echo "%{$fg[green]%}auth" || echo "%{$fg[red]%}auth"
}

# Is gb-web running?
function is_web_running() {
	WEB_PID=$(test -f ~/Library/Application\ Support/gbcli/pids/gb-web.pid && cat ~/Library/Application\ Support/gbcli/pids/gb-web.pid)
	test $WEB_PID && echo "%{$fg[green]%}web" || echo "%{$fg[red]%}web"
}

# Is alpine running
function is_alpine_running() {
	LOCAL_WEBAPP=$(netstat -an | grep LISTEN | GREP 6543)
	test $LOCAL_WEBAPP && RESPONSE="%{$fg[green]%}alpine"
	DOCKER_WEBAPP=$(docker 2&> /dev/null && docker ps --format="{{.Names}}" --filter name=webapp_webapp_1)
	RESPONSE="%{$fg[red]%}alpine"
	test $DOCKER_WEBAPP && test $DOCKER_WEBAPP = "webapp_webapp_1" && RESPONSE="%{$fg[cyan]%}alpine"
	echo $RESPONSE
}

# Is alpine-postgres running
function is_alpine_pg_running() {
	DB=$(docker 2&> /dev/null && docker ps --format="{{.Names}}" --filter name=infra_alpine-postgres_1)
	test $DB && test $DB = "infra_alpine-postgres_1" && echo "%{$fg[green]%}db" || echo "%{$fg[red]%}db"
}

# Is redis running
function is_alpine_redis_running() {
	REDIS=$(docker 2&> /dev/null && docker ps --format="{{.Names}}" --filter name=infra_redis_1)
	test $REDIS && test $REDIS = "infra_redis_1" && echo "%{$fg[green]%}redis" || echo "%{$fg[red]%}redis"
}

# PROMPT='%{$fg[cyan]%}%~ %{$reset_color%}%{$reset_color%}$(prompt_char)'

 RPROMPT='${return_status}%{$fg[blue]%}$(python_version) %{$fg[green]%}$(node_version) %{$reset_color%}'


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then

    if [ -f ~/.dir_colors ]; then
       eval "`dircolors -b ~/.dir_colors`"
    fi

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

#gfind by dpatierno
gfind () { if [ $# -lt 2 ]; then files="*"; search="${1}"; else files="${1}"; search="${2}"; fi; find -P . -name "$files" -a ! -wholename '*/.*' -exec grep -Hin ${3} "$search" {} \; ; }

#psgrep
function psgrep(){
    if [[ -t 1 ]]; then
        local color=always
    else
        local color=never
    fi
    ps -ef | head -n 1
    ps -ef | grep --color=$color "$@" | grep -v grep
}

# set the path.
PATH=/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/lib64/java/bin:/usr/games/:$PATH
[ -d ~/bin ] && PATH=~/bin:$PATH

# i <3 vim
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim

# less is more
export PAGER=less

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# move in bash like it's vi
set -o vi


# python
export PATH="/Users/bensweedler/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# oh howd this get here
export PATH="/Users/bensweedler/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

function gui(){
    if [[ $1 == sudo ]]; then
        shift
        gksudo &>/dev/null "$@" &
        disown
    else
        setsid --fork &>/dev/null "$@"
    fi
}

export PATH="$HOME/.poetry/bin:$PATH"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

source ~/.aliasrc