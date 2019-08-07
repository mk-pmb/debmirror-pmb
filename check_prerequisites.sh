#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function check_prerequisites () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  # local SELFPATH="$(readlink -m "$BASH_SOURCE"/..)"
  # cd -- "$SELFPATH" || return $?

  local APT_NEED= HAD_ERRORS=
  check_perl_libs || return $?

  if [ -n "$APT_NEED" ]; then
    APT_NEED="$(<<<"$APT_NEED" grep -oPe '\S+' | LANG=C sort -V)"
    APT_NEED="${APT_NEED//$'\n'/ }"
    echo "E: missing apt packages: $APT_NEED" >&2
    HAD_ERRORS+=+
  fi

  return "${#HAD_ERRORS}"
}


function check_perl_libs () {
  local PERL_LIBS=(
    Net::INET6Glue/::FTP
    LockFile::Simple
    )
  local LIB= PKG=
  for LIB in "${PERL_LIBS[@]}"; do
    PKG="${LIB,,}"
    LIB="${LIB//\//}"
    perl -e "require $LIB" &>/dev/null && continue
    PKG="${PKG%%/*}"
    PKG="${PKG//::/-}"
    PKG="lib${PKG}-perl"
    # echo "W: missing perl lib '$LIB', apt package is '$PKG'." >&2
    APT_NEED+=" $PKG"
  done
}


check_prerequisites "$@"; exit $?
