TailScale
=========

Bring up on Docker
------------------

.. code-block:: bash

  ## Bring up
  # 1. create a copy
  cp .env .env.local
  # 2. update value
  # 3. bring up with docker-compose
  docker-compose --env-file .env.local up -d

  ## Check Service Status
  docker exec tailscaled tailscale --socket /tmp/tailscaled.sock status


Bring up on Raspberry Pi OS Bookworm
------------------------------------

.. code-block:: bash

  curl -fsSL https://tailscale.com/install.sh | sh

