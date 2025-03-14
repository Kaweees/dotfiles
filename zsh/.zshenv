# Set the directory where the dotfiles and zsh configuration are stored
export DOTFILES="$HOME/Documents/GitHub/Projects/dotfiles"
export ZDOTDIR="$DOTFILES/zsh"

# -------------------------------------------------------------------
# Load .zshrc
# -------------------------------------------------------------------
[[ ! -f $ZDOTDIR/.zshrc ]] || source $ZDOTDIR/.zshrc
