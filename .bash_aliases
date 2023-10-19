#! /bin/env bash
if [[ $(uname -r) == *"microsoft"* ]];
then
	# Windows WSL specific aliases
	alias pbcopy='clip.exe'
	alias pbpaste='powershell.exe Get-Clipboard'
	# Trim new lines and copy to clipboard
	alias c="tr -d '\\n' | clip.exe"
	# Pipe my public key to my clipboard.
	alias pubkey="more ~/.ssh/id_rsa.pub | clip.exe | echo '=> Public key copied to pasteboard.'"
	# Pipe my private key to my clipboard.
	alias prikey="more ~/.ssh/id_rsa | clip.exe | echo '=> Private key copied to pasteboard.'"
	# Note: Bash on Windows does not currently apply umask properly.
	if [ "$(umask)" = "0000" ]; then
		umask 022
	fi
fi 

if [[ $(uname -v) == *"Ubuntu"* ]];
then
	# Linux specific aliases
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
	# Trim new lines and copy to clipboard
	alias c="tr -d '\\n' | xclip -selection clipboard"
	# Pipe my public key to my clipboard.
	alias pubkey="more ~/.ssh/id_rsa.pub | xclip -selection clipboard | echo '=> Public key copied to pasteboard.'"
	# Pipe my private key to my clipboard.
	alias prikey="more ~/.ssh/id_rsa | xclip -selection clipboard | echo '=> Private key copied to pasteboard.'"
fi

if [[ $(uname) == *"Darwin"* ]];
then
	# Pipe my public key to my clipboard.
	alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
	# Pipe my private key to my clipboard.
	alias prikey="more ~/.ssh/id_rsa | pbcopy | echo '=> Private key copied to pasteboard.'"
fi


# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts

alias reloadbash="source ~/.profile && echo Bash config reloaded"
alias ping='ping -c 5'
alias foldersize='du -h -d1'
alias drives='df -h'

alias flushdns="sudo /etc/init.d/dns-clean restart && echo DNS cache flushed"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# List only directories
# shellcheck disable=SC2139
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
# shellcheck disable=SC2139
alias ls="ls -lah ${colorflag}"
export LS_COLORS='rs=0:di=38;5;33:ln=38;5;51:mh=00:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=01;05;37;41:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;40:*.tar=38;5;9:*.tgz=38;5;9:*.arc=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lha=38;5;9:*.lz4=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.tzo=38;5;9:*.t7z=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lrz=38;5;9:*.lz=38;5;9:*.lzo=38;5;9:*.xz=38;5;9:*.zst=38;5;9:*.tzst=38;5;9:*.bz2=38;5;9:*.bz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.war=38;5;9:*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.alz=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.cab=38;5;9:*.wim=38;5;9:*.swm=38;5;9:*.dwm=38;5;9:*.esd=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.mjpg=38;5;13:*.mjpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.webm=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.m4a=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.oga=38;5;45:*.opus=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:'

# Always enable colored `grep` output
alias grep='grep --color=auto '

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Enable aliases to be watched
alias watch='watch '

# Get week number
alias week='date +%V'
# Get day of year
alias day='date +%j'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# tar
alias untar='tar xvf'
alias unziptar='tar xzvf'
alias ziptar='tar zcvf'

# kubernetes
alias k='kubectl'
complete -o default -F __start_kubectl k

alias micro='chgenv micro'

alias kube-psp-advisor='kubectl advise-psp --kubeconfig $KUBECONFIG'
complete -o default -F __start_kubectl kube-psp-advisor

# ssl cert decoding
alias decodessl='openssl x509 -text -noout -in'

alias rename='rename.ul'

alias tf='terraform'

if [[ $(uname -r) == *"microsoft"* ]];
then
    alias multipass='multipass.exe'
    alias mp='multipass.exe'
else
   alias mp='multipass'
fi
