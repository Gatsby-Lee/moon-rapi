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


Run playbook Remotely
---------------------

* https://docs.ansible.com/ansible/latest/inventory_guide/connection_details.html

.. code-block:: bash

    # Run with CLI params
    # --check won't do the real execution.
    ansible-playbook --inventory [ip,hostname,], --user <ssh-user> --private-key ~/.ssh/<private-key> --check setup-rpi-bookworm-to-dns-node-v1.yaml
    ansible-playbook --inventory [ip,hostname,], --user <ssh-user> --private-key ~/.ssh/<private-key> setup-rpi-bookworm-to-dns-node-v1.yaml --list-hosts
    # although the tags are specified, the all list of play will be shown in --list-hosts.
    ansible-playbook --inventory [ip,hostname,], --user <ssh-user> --private-key ~/.ssh/<private-key> setup-rpi-bookworm-to-dns-node-v1.yaml --tags "setup_unbound"


Install Ansible in Raspberry Pi
-------------------------------

.. code-block:: bash

    sudo apt install ansible


Ansible Playbook
----------------

.. code-block:: bash

    # check playbook
    ansible-playbook --check setup-rpi-bookworm-to-dns-node-v1.yaml


Roles
-----

* https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html
