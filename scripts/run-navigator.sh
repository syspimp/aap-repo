#!/bin/bash
inventory="hosts.inv"

if [[ ! $1 ]]
then
  echo -e "\n\m give me a playbook to run like:\n $0 mycoolplaybook.yml\nOr\n $0 -i inventoryfile mycoolplaybook.yml\n\n"
  exit 1
fi

playbook=$1

while getopts "di:" OPTION
do
  case "$OPTION" in
    # debug
    d) set -x
    ;;
    i) inventory="$OPTARG"
    ;;
  esac
done

main()
{
  # code goes here
  if [[ -e '.vault_password.sh' ]]
  then
    export ANSIBLE_VAULT_PASSWORD_FILE=.vault_password.sh
  else
    echo -e "You need to run scripts/set-vault-password.sh and follow the instructions. I'm assuming you have something vaulted. Maybe not. It's harmless to do if you don't.\n\n"
    exit 1
  fi

  if [[ ! -e "${inventory}" ]]
  then
    echo -e "Inventory file ${inventory} does not exist. You need to edit hosts.inv.example and copy to hosts.inv, or supply your own inventory file with: $0 -i myinventoryfile myplaybook.yml\n\n"
    exit 1
  fi

  ansible-navigator -m stdout run ${playbook} --inventory ${inventory} --playbook-artifact-enable false
}

main
exit 0


