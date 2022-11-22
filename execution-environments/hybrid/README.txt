Step 1
edit ansible.cfg.example and enter in your redhat offline token
https://access.redhat.com/management/api
copy to ansible.cfg

Step 2
log into the redhat registry to pull containers
https://access.redhat.com/RegistryAuthentication
podman login registry.redhat.io

Step 3
log into your docker.io registery to accept the push containers
podman login docker.io

Step 4
build
ansible-builder build -v 3 --no-cache -t myhybridtag:latest

# Documention: https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.2/html/creating_and_consuming_execution_environments/assembly-using-builder
# More docs: https://docs.ansible.com/automation-controller/latest/html/userguide/ee_reference.html
# build with:
  ansible-builder build -v 3 --no-cache -t <tag>:<latest or version>
# tag with:
  podman tag <tag>:<version> <docker username>/<docker repo>:<version>
# login with:
  podman login docker.io or registry.redhat.io
# push with:
  podman push <docker username>/<docker repo>:<version>
