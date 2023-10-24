docker containers
=================

Print Formatted Output
----------------------

.. code-block:: bash

  docker ps | less -S
  docker ps --format '{{ json .}}' | jq .
