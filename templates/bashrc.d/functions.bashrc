#!/usr/bin/env bash

with_trace() {
    if [ -n "$1" ] ; then
        local original_xtrace_setting
        original_xtrace_setting="$(shopt -po xtrace)"

        set -x
        $1
        { STATUS=$?; eval "$original_xtrace_setting"; } 2>/dev/null     

        return $STATUS
    else
        echo "usage: with_trace '<command>'"
    fi
}

{% if functions and functions['compression'] %}
pack() {
    if [ -n "$1" ] ; then
        FILE=$1
        case $FILE in
            *.tar)      with_trace "tar cf $*" ;;
            *.tbz2|*.tar.bz2)  with_trace "tar cjf $*" ;;
            *.tgz|*.tar.gz)    with_trace "tar czf $*" ;;
            *.zip)      with_trace "zip $*" ;;
            *.rar)      with_trace "rar $*" ;;
            *)          echo "unknown compression method established from extension of '$FILE'" ;;
        esac
    else
        echo "usage: pack <foo.tar.gz> ./foo ./bar"
    fi
}

unpack() {
    if [ -f "$1" ] ; then
        case $1 in
            *.rar)               with_trace "rar x $1" ;;
            *.tar)               with_trace "tar xvf $1" ;;
            *.tbz2|*.tar.bz2)    with_trace "tar xvjf $1" ;;
            *.bz2)               with_trace "bunzip2 $1" ;;
            *.tgz|*.tar.gz)      with_trace "tar xvzf $1" ;;
            *.gz)                with_trace "gunzip $1" ;;
            *.tar.xz)            with_trace "tar xvJf $1" ;;
            *.zip|*.apk|*.epub|*.xpi|*.war|*.jar)   with_trace "unzip $1" ;;
            *.Z)                 with_trace "uncompress $1" ;;
            *.7z)                with_trace "7z x $1" ;;
            *)                   echo "unknown compression established from extension of '$1'" ;;
        esac
    else
        echo "usage: unpack <compressed-file-with-extension>"
    fi
}
{% endif -%}
