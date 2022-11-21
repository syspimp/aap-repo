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
  sudo dnf install -y --enablerepo=ansible-automation-platform-2.2-for-rhel-8-x86_64-rpms ansible-navigator ansible-runner ansible-builder
}

main
exit 0


