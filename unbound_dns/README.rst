Unbound DNS
===========

.. code-block:: bash

  docker run \
  --name=unbound-dns \
  --publish=5335:53/tcp \
  --publish=5335:53/udp \
  --volume=$(pwd)/extra-server-options.conf:/opt/unbound/etc/unbound/a-records.conf:ro \
  --volume=$(pwd)/custom-forward-zone.conf:/opt/unbound/etc/unbound/forward-zone.conf:ro \
  --restart=unless-stopped \
  --detach=true \
  mvance/unbound-rpi:1.17.1
