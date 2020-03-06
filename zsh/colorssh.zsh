#!/bin/env zsh

DEFAULT_PROFILE_NAME="Default"
STAGING_PROFILE_NAME="staging"
PROD_PROFILE_NAME="prod"

function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME=$DEFAULT_PROFILE_NAME; fi
  echo -e "\033]50;SetProfile=$NAME\a"
}

function tab-reset() {
    echo -e "\033]50;SetProfile=$DEFAULT_PROFILE_NAME\a"
    trap - INT EXIT
}

function colorssh() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT
        if [[ "$*" =~ "staging" ]]; then
            tabc $STAGING_PROFILE_NAME
        fi
        if [[ "$*" =~ "prod" ]]; then
            tabc $PROD_PROFILE_NAME
        fi
    fi
    ssh $*
}
compdef _ssh tabc=ssh

alias ssh="colorssh"
