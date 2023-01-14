#!/bin/bash
# use this to pass the vault secret to ansible navigator
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
  if [[ ! -e ~/.vault_password.sh ]]
  then
    echo -e '#!/bin/sh\necho ${ANSIBLE_VAULT_SECRET}' >> ~/.vault_password.sh
    chmod 700 ~/.vault_password.sh
    ln ~/.vault_password.sh .
  fi
  export ANSIBLE_VAULT_PASSWORD_FILE=.vault_password.sh
  echo -e "ALL SET! You need to copy/paste:\n\nexport ANSIBLE_VAULT_SECRET=yourpassword"

}

main
exit 0


