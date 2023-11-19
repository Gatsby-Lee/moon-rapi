Homearr
=========

Setup
-----

.. code-block:: bash

  # 1. create a copy
  cp .env .env.local
  # 2. update value
  # 3. bring up with docker-compose
  docker-compose --env-file .env.local up -d
  # OR
  docker compose --env-file .env.local up -d


References
----------

* https://hub.docker.com/r/deluan/navidrome
* https://www.navidrome.org/docs/installation/docker/
