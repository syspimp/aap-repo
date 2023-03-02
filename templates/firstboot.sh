#!/bin/bash -x

while getopts "dr" OPTION
do
  case "$OPTION" in
    # debug
    d) set -x
    ;;
    r) rm -rf /var/log/firstboot
    ;;
  esac
done

main()
{
  # code goes here
  growpart /dev/sda 3
  xfs_growfs /dev/sda3
  # configuration management loop
  if [ -e /var/log/firstboot/.success ]
  then
     echo "*** firstboot.sh already run"
     echo "*** firstboot.sh delete /var/log/firstboot to run again"
     exit 0
  fi

  mkdir -p /var/log/firstboot

  # wait for the network to wake up
  while ! ping -c 1 -W 2 10.104.200.213 > /dev/null
  do
    sleep 5
  done
  
  useradd ansiblesvc
  mkdir -p /home/ansiblesvc/.ssh
  echo "rsa publickey yada yada PUT YOUR PUBLIC KEY HERE" > /home/ansiblesvc/.ssh/authorized_keys
  chown -R ansiblesvc.ansiblesvc /home/ansiblesvc/.ssh
  chmod 700 /home/ansiblesvc/.ssh
  chmod 600 /home/ansiblesvc/.ssh/authorized_keys
  echo -e "#for automation user\nansiblesvc ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansiblesvc
  chmod 440 /etc/sudoers.d/ansiblesvc

  # wait until tower/aws returns a success message
  while [[ ! -e /var/log/firstboot/.success ]]
  do
    curl -s -k --data 'host_config_key=firstboot' https://10.104.200.213/api/v1/blah/blah/balah | \
    grep msg || \
    touch /var/log/firstboot/.success
    sleep 10
  done
}

main
exit 0


