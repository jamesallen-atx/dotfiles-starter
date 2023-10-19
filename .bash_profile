#!/bin/bash
if [[ $(uname) == *"Darwin"* ]];
then
	export PATH="/opt/homebrew/bin/:$PATH"
	export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
else
	export SSH_AUTH_SOCK=$HOME/.1password/agent.sock
fi

source ./bashrc

if [[ $(uname) == *"Darwin"* ]];
then
	export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"
	test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
else
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

