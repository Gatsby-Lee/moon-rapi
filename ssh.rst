SSH
===

On MacOS, if SSH fails due to the DNS resolution
------------------------------------------------

"nslookup" and "dig +search", bue somehow SSH doesn't work because it could not resolve hostname

.. code-block:: bash

  sudo killall mDNSResponder
