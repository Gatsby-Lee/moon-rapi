Unbound DNS
===========

.. image:: https://img.shields.io/docker/pulls/wowbro/unbound-dns-rpi
  :alt: Docker Pulls
  :target: https://hub.docker.com/repository/docker/wowbro/unbound-dns-rpi/general


* Based on `MatthewVance/unbound-docker-rpi <https://github.com/MatthewVance/unbound-docker-rpi>`_

* Built own `Docker Image - ARM / ARM64 <https://hub.docker.com/r/wowbro/unbound-dns-rpi/tags>`_

* Expose 127.0.0.1:53

* Iterative DNS

  * Download root.hints ``curl -o root.hints https://www.internic.net/domain/named.root``

.. code-block:: bash

  docker run \
  --name=unbound-dns \
  --publish=5335:53/tcp \
  --publish=5335:53/udp \
  --restart=unless-stopped \
  --detach=true \
  wowbro/unbound-dns-rpi:1.17.1

  # OR
  docker-compose up -d
  docker compose up -d

Build Image for ARM and ARM64
-----------------------------

.. code-block:: bash

  git clone https://github.com/Gatsby-Lee/unbound-docker-rpi
  cd unbound-docker-rpi/1.17.1

  docker buildx build \
    --tag wowbro/unbound-dns-rpi:1.17.1 \
    --platform linux/arm/v7,linux/arm64/v8 \
    --builder container \
    --push .
