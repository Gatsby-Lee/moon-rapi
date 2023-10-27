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
