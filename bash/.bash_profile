
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export CLICOLOR=1

# macOS
if [ -x "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# (WSL only) Avoid starting by default in sytem32
if [[ -n $WSL_DISTRO_NAME && "$PWD" == "/mnt/c/windows/system32" ]]; then
    cd ~
fi
