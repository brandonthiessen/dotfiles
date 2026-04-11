
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export CLICOLOR=1

eval "$(/opt/homebrew/bin/brew shellenv)"
