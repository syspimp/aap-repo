# build with:
  ansible-builder build -v 3 --no-cache -t <tag>:<latest or version>
# tag with:
  podman tag <tag>:<version> <docker username>/<docker repo>:<version>
# login with:
  podman login docker.io or registry.redhat.io
# push with:
  podman push <docker username>/<docker repo>:<version>
