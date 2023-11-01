docker containers
=================

Print Formatted Output
----------------------

.. code-block:: bash

  docker ps | less -S
  docker ps --format '{{ json .}}' | jq .


Container resource usage
------------------------

.. code-block:: bash

  docker stats


Copy content in container
-------------------------

.. code-block:: bash

  docker cp <container-id>:/opt/unbound/etc/unbound/unbound.conf .


Install docker-compose
----------------------

.. code-block:: bash

  sudo -i

  # Download docker-compose
  curl -SL https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-armv7 -o /opt/bin/docker-compose

  # Add execution permission
  chmod +x /opt/bin/docker-compose
