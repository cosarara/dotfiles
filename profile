export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_TEMPLATES_DIR=~/.local/share/templates/
export XKB_DEFAULT_LAYOUT=ja

#export DEVKITPRO=~/devkitpro
#export DEVKITARM=$DEVKITPRO/devkitARM
#export DEVKITPPC=$DEVKITPRO/devkitPPC
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

#export PATH=$PATH:$DEVKITARM/bin
#export TONCCODE=$DEVKITPRO/tonc-code

#export NPM_PACKAGES=/home/jaume/.npm-packages
#export NODE_PATH=/home/jaume/.npm-packages/lib/node_modules:
#export PATH=$NPM_PACKAGES/bin:$PATH
export PATH=${XDG_DATA_HOME}/npm/bin:$PATH

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc


ruby_path="$(ruby -e 'print Gem.user_dir')/bin"
export PATH="$ruby_path:$PATH"

export ANDROID_NDK_PATH=/opt/android-ndk

export JPM_FIREFOX_BINARY=/usr/bin/firefox

export TERMINAL="mate-terminal"
export EDITOR="nvim"
export VISUAL="nvim"
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
#export WINEARCH="win32"
export BROWSER="firefox"
#export QT_STYLE_OVERRIDE="breeze"

#export WINEPREFIX="$HOME/.wine"

export BSPWM_TREE=/tmp/bspwm.tree
export BSPWM_HISTORY=/tmp/bspwm.history
export BSPWM_STACK=/tmp/bspwm.stack
export PANEL_FIFO=/tmp/panel_fifo
export XDG_MUSIC_DIR=~/music

export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat

export GOPATH=~/coses/go
export PATH=$GOPATH/bin:$PATH

export CHICKEN_REPOSITORY=~/.local/lib/chicken/8

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0
#export LD_LIBRARY_PATH=$HOME/.local/lib:/usr/local/lib:$LD_LIBRARY_PATH
export NVIM_TUI_ENABLE_TRUE_COLOR=1

export MAKEFLAGS=-j5

#export STEAM_RUNTIME=1

export EMU="-r$HOME/coses/inferno-os -c0 -g1024x768"

export PATH="$HOME/.cargo/bin:$PATH"

rust_root="$(rustc --print sysroot)"
export RUST_SRC_PATH="$rust_root/lib/rustlib/src/rust/src"
export RUSTC_WRAPPER=sccache

export LUAROCKS_CONFIG=$HOME/.config/luarocks/config.lua

export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

#mozilla
export MOZCONFIG=/mnt/data3/mozilla/mozconfig

[ -f /home/jaume/.rakudobrew/bin/rakudobrew ] && \
    eval "$(/home/jaume/.rakudobrew/bin/rakudobrew init Zsh)"

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

export DOTNET_CLI_TELEMETRY_OPTOUT=1
