###################################
######### fish-user Paths #########
###################################

set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.npm-global/bin" $fish_user_paths

###################################
######### env parameters  #########
###################################

# **** Android SDK ****
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"

# **** NPM ****
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-global"

# **** BAT ****
set -gx BAT_THEME "GitHub"

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

# **** NPM ****
set -gx PATH "$NPM_CONFIG_PREFIX/bin" $PATH

###################################
############# aliases #############
###################################

# **** Terminal stuffs ****
alias cat=bat
alias ls=exa
alias grep=rg

# **** git clean alias ****
alias git_reflog_expire="git reflog expire --expire=now --all"
alias git_repack_ad="git repack -ad"
alias git_prune="git prune"

# **** python3 ****
alias python=/usr/local/bin/python3

# **** Virtual ENV alias ****
alias venv "source $HOME/env/bin/activate.fish" # Activate V-Env by request

###################################
########## init scripts ###########
###################################

# **** starship ****
source ("/usr/local/bin/starship" init fish --print-full-init | psub)

# **** fnm ****
fnm env --shell=fish --multi | source
