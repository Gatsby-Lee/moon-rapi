Users / Groups / Permissions
============================

.. code-block:: bash

  cd ~
  mkdir ~/.ssh
  vim .ssh/authorized_keys
  chmod u+rw,go-rwx .ssh/authorized_keys


SSH File Permissions
====================

.. code-block:: bash

  chmod u+rw,go-rwx .ssh/id_rsa
  chmod u+rw,go-rwx .ssh/id_rsa.pub
  chmod u+rw,go-rwx .ssh/authorized_keys
  chmod u+rw,go-rwx .ssh/known_hosts
  chmod u+rw,go-rwx .ssh/config
  # OR
  chmod 600 .ssh/id_rsa
  chmod 600 .ssh/id_rsa.pub
  chmod 600 .ssh/authorized_keys
  chmod 600 .ssh/known_hosts
  chmod 600 .ssh/config


SSH Key creation
================

.. code-block:: bash

  ssh-keygen -t ed25519 -C "your_email@example.com"
