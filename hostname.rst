Hostname
========

.. code-block:: bash

  # reboot is NOT required to apply the change
  hostnamectl
  # to network
  hostnamectl set-hostname <new-hostname>
  # only to user
  hostnamectl set-hostname "new-hostname" --pretty

  # !!NOTE
  `hostnamectl` doesn't update the record in /etc/hosts
  Even Ansible host module doesn't update the record in /etc/hosts as well.
