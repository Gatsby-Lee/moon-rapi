Unbound DNS
===========

* Based on `MatthewVance/unbound-docker-rpi <https://github.com/MatthewVance/unbound-docker-rpi>`

* Built own `Docker Image - ARM / ARM64 <https://hub.docker.com/r/wowbro/unbound-dns-rpi/tags>`

* Expose 127.0.0.1:53

* Iterative DNS

  * Download root.hints "curl -o root.hints https://www.internic.net/domain/named.root"

.. code-block:: bash

  docker run \
  --name=unbound-dns \
  --publish=5335:53/tcp \
  --publish=5335:53/udp \
  --restart=unless-stopped \
  --detach=true \
  wowbro/unbound-dns-rpi:1.17.1
