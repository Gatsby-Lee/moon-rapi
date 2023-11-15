Ansible
=======

Run Playbook Locally
--------------------

.. code-block:: bash

    ansible-playbook --connection=local --inventory 127.0.0.1, install-docker-on-rpios-bookworm.yaml -vvv


Other ways to run playbook locally
----------------------------------

* using inventory:

.. code-block:: ini

    127.0.0.1 ansible_connection=local


* using Ansible configuration file:

.. code-block:: ini

    [defaults]
    transport = local


* using playbook header:

.. code-block:: yaml

    - hosts: 127.0.0.1
      connection: local
