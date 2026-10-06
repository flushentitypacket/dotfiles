#!/bin/env zsh

# iterm-specific zsh settings

# ############################
# SET TAB TITLE TO CURRENT DIR
# ############################

# make sure function is available
autoload -Uz add-zsh-hook

tab_title() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}
add-zsh-hook precmd tab_title

