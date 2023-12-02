Cloudflare Tunnel Local Mgmt ( CLI )
====================================

.. code-block:: bash

  # login / check existing tunnel
  cloudflared tunnel login


.. code-block:: bash

  # create tunnel
  cloudflared tunnel create wowamazon-local
  cloudflared tunnel list


Create Route - Exposer Local Service to Internet with Public Hostname
---------------------------------------------------------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/routing-to-tunnel/dns/

.. code-block:: bash

  ## create dns record with wildcard
  # @note: currently, the dns record can be removed only through Cloudflare dashboard
  cloudflared tunnel route dns wowamazon-local *.wowamazon.party

  ## 

Create Ingress
--------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/configuration-file/


Run Cloudflare
--------------

.. code-block:: bash

  cloudflared tunnel --config /path/your-config-file.yml run
  OR
  cloudflared tunnel run


Deploy new Config with Replicas
-------------------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/configuration-file/#update-a-configuration-file


Run clound as service
---------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/as-a-service/linux/

.. code-block:: bash

  # TBD
