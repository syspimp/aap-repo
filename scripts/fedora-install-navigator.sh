#!/bin/bash

while getopts "d" OPTION
do
  case "$OPTION" in
    # debug
    d) set -x
    ;;
  esac
done

main()
{
  # code goes here
  python3 -m pip install ansible-navigator --user
  sudo yum install ansible-builder
}

main
exit 0


