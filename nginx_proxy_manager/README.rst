Nginx Proxy Manager
===================

Note
----

* default login ( admin@example.com | changeme )


Setup
-----

.. code-block:: bash

  # 1. create a copy
  cp .env .env.local
  # 2. update value
  # 3. bring up with docker-compose
  docker-compose --env-file .env.local up -d


Tutorials / References
----------------------

* `How to instll Docker-Compose on Flatcar Container Linux <https://medium.com/@life-is-short-so-enjoy-it/homelab-raspberry-pi-flatcar-install-nginx-proxy-manager-by-docker-compose-0aae4a02fb38>`_
* `How to instll Nginx Proxy Manager <https://medium.com/@life-is-short-so-enjoy-it/homelab-raspberry-pi-flatcar-install-nginx-proxy-manager-by-docker-compose-0aae4a02fb38>`_
* `How to setup SSL Certicate on Nginx Proxy Manager <https://medium.com/p/732af64ddc0b>`_
