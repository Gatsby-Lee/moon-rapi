TailScale
=========

Setup
-----

.. code-block:: bash

  # 1. create a copy
  cp .env .env.local
  # 2. update value
  # 3. bring up with docker-compose
  docker-compose --env-file .env.local up -d

Check Service Status
--------------------

.. code-block:: bash

  docker exec tailscaled tailscale --socket /tmp/tailscaled.sock status
