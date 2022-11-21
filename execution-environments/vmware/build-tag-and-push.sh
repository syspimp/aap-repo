#!/bin/bash
# log into your provider first
# podman login docker.io
TAG="vmwarez5:latest"
USE_CACHE=""
VERBOSE=1
UPSTREAM_REPO="docker.io/syspimp/ansible-ee"
UPSTREAM_TAG="vmware"
while getopts "dt:nu:p:v:h" OPTION
do
  case "$OPTION" in
    # debug
    d) set -x
    ;;
    t) TAG="${OPTARG}"
    ;;
    n) USE_CACHE="--no-cache"
    ;;
    u) UPSTREAM_REPO="${OPTARG}"
    ;;
    p) UPSTREAM_TAG="${OPTARG}"
    ;;
    v) VERBOSE="${OPTARG}"
    ;;
    h) echo
       echo -e "Usage: $0 \n  -t <tag> \n  -v <verbose level (default 1)\n  -n Don't use the container cache, useful when changing earlier layers\n\n"
    ;;
  esac
done

main()
{
  # code goes here
  if [[ -z "${TAG}" ]]
  then
    echo "\n**Need a tag, friend.\nTry $* -t yourmoms:latest\n\n"
    exit 1
  fi
  echo "**Building the image"
  ansible-builder build -t ${TAG} -v ${VERBOSE} ${USE_CACHE}
  echo "**Tagging the image..."
  podman tag localhost/${TAG} ${UPSTREAM_REPO}:${UPSTREAM_TAG}
  echo "**Pushing to the cloud..."
  podman push ${UPSTREAM_REPO}:${UPSTREAM_TAG}
}

main
exit 0

