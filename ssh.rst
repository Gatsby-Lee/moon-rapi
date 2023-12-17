SSH
===

On MacOS, if SSH fails due to the DNS resolution
------------------------------------------------

* "nslookup" and "dig +search", but somehow SSH doesn't work because it could not resolve hostname
* The killed mDNSResponder will be relaunched.

.. code-block:: bash

  sudo killall mDNSResponder


.ssh permission
---------------

.. code-block:: bash

  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/authorized_keys


.ssh/config OR .ssh_config
-------------------------

https://goteleport.com/blog/ssh-config/

