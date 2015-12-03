#!/bin/sh

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

export TITLEBAR='\[\033]0;\u@\h: \w\007\]'

case "$TERM" in
xterm*|rxvt*)
    export PS1="$TITLEBAR$PS1"
esac

