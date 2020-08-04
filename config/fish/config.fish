# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias workspace='cd /c/Users/MatthewCarr/workspace'
alias localpath='/usr/local/bin/'

alias paste.exe='Powershell.exe Get-Clipboard'
alias k='kubectl'

# enable virtualfish
eval (python -m virtualfish)

# enable thefuck
thefuck --alias | source

set PATH $PATH "$HOME/.local/bin"
set PATH $PATH "/c/Users/MatthewCarr/workspace/gyarados/bashScripts"

set PYENV_ROOT "$HOME/.pyenv"
set PATH "$PYENV_ROOT/bin" $PATH
if command -v pyenv 1>/dev/null 2>&1
  source (pyenv init - | psub)
end
