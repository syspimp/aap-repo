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
  podman rmi --all --force
  buildah rm --all

}

main
exit 0


