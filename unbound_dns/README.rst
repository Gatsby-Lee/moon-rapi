Unbound DNS
===========

.. code-block:: bash

  docker run \
  --name=unbound-dns \
  --publish=5335:53/tcp \
  --publish=5335:53/udp \
  --restart=unless-stopped \
  --detach=true \
  wowbro/unbound-dns-rpi:1.17.1
