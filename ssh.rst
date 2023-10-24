SSH
===

On MacOS, if SSH fails due to the DNS resolution
------------------------------------------------

* "nslookup" and "dig +search", but somehow SSH doesn't work because it could not resolve hostname
* The killed mDNSResponder will be relaunched.

.. code-block:: bash

  sudo killall mDNSResponder
