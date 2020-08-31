###################################
######### fish-user Paths #########
###################################

set -gx fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.npm-global/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/go/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.cargo/bin" $fish_user_paths

###################################
######### env parameters  #########
###################################

switch (uname)
  case Darwin
    alias cat=bat

  case Linux
    set -gx MOZ_USE_OMTC 1
    alias cat=batcat

end

# **** Brew ****
set -gx HOMEBREW_NO_ANALYTICS 1

# **** Android SDK ****
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"

# **** NPM ****
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-global"

# **** BAT ****
set -gx BAT_THEME "Monokai Extended Bright"

# **** GO ****
set -gx GOPATH "$HOME/go"

# **** Rust (Cargo) ****
set -gx CARGO_INSTALL_ROOT "$HOME/.cargo"
set -gx CARGO_HOME "$HOME/.cargo"

# **** nFanCurve ****
set -gx NFANCURVE_PATH "$HOME/nfancurve"

# ********************************
# ********* openssl env **********
# ********************************

set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"

# ********************************
# ********** path env ************
# ********************************

# **** Android SDK ****
set -gx PATH "$ANDROID_HOME/emulator" $PATH
set -gx PATH "$ANDROID_HOME/tools" $PATH
set -gx PATH "$ANDROID_HOME/tools/bin" $PATH
set -gx PATH "$ANDROID_HOME/platform-tools" $PATH

# **** Homebrew - Linux ****
set -gx PATH "$HOMEBREW_PREFIX/bin" $PATH
set -gx PATH "$HOMEBREW_PREFIX/sbin" $PATH

# **** NPM ****
set -gx PATH "$NPM_CONFIG_PREFIX/bin" $PATH

# **** GO ****
set -gx PATH "$HOME/go/bin" $PATH

# **** Rust (Cargo) ****
set -gx PATH "$HOME/.cargo/bin" $PATH

# **** LSP ****
set -gx PATH "$HOME/lsp/bin" $PATH

###################################
############# aliases #############
###################################

# **** Terminal stuffs ****
alias ls=exa
alias grep=rg
alias vim=nvim

# **** git clean alias ****
alias git_reflog_expire="git reflog expire --expire=now --all"
alias git_repack_ad="git repack -ad"
alias git_prune="git prune"
alias git_rb="git fetch --all --prune && git pull --rebase && git submodule update --init --recursive"

# **** python3 ****
alias python=python3

# **** Virtual ENV alias ****
alias venv "source $HOME/env/bin/activate.fish" # Activate V-Env by request

# **** fnm ****
alias load_fnm "fnm env --shell=fish --multi | source"

# **** test internet speed ****
alias inet_speed_test "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

# **** manager updates and cleanups ****
alias update_all "brew update --verbose && brew upgrade --verbose && brew cask upgrade --greedy --verbose && brew cleanup && brew cleanup -s && update_modules"
alias update_modules "npm update -g && cd ~/Desktop && git_rb"
alias brew_cleanup "brew cleanup --prune 0 && brew cleanup -s"

###################################
########## init scripts ###########
###################################

# **** starship ****
starship init fish | source
