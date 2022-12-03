#!/bin/bash
if [[ ! $1 ]]
then
  echo -e "\n\m give me a playbook to run like: $0 mycoolplaybook.yml\n\n"
  exit 1
fi

playbook=$1

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
  export ANSIBLE_VAULT_PASSWORD_FILE=.vault_password.sh
  ansible-navigator -m stdout run $playbook --inventory hosts.inv
}

main
exit 0


