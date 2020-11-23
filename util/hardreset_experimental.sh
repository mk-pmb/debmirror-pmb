#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-

function reex () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local DM_PATH="$(readlink -m -- "$BASH_SOURCE"/../..)"
  cd -- "$DM_PATH" || return $?
  git fetch origin || return $?
  git reset --hard origin/experimental || return $?
  chown --reference . -R . || return $?
}

reex "$@"; exit $?
