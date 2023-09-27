Hostname
========

.. code-block:: bash

  # reboot is not required to apply the change
  hostnamectl
  # to network
  hostnamectl set-hostname <new-hostname>
  # only to user
  hostnamectl set-hostname "new-hostname" --pretty
