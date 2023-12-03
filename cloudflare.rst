Cloudflare Tunnel Local Mgmt ( CLI )
====================================

Entities
--------

* Login
* Tunnel ( tunnel )
* DNS ( route dns
* Route IP ( route ip )
* Virtual Network ( vnet )

Login / Get cert.pem
--------------------

.. code-block:: bash

  ## login / check existing tunnel
  # @note: this will create cert.pem under /home/<user>/.cloudflared folder.
  cloudflared tunnel login


Create a Tunnel
---------------

.. code-block:: bash

  ## create tunnel
  # Creating a tunnel command will
  # 1. Create a tunnel by establishing a persistent relationship between the name you provide and a UUID for your tunnel.
  # 2. Generate a tunnel `credentials file (*.json) in the default cloudflared directory ( /home/<user>/.cloudflared ).
  # 3. Create a subdomain of .cfargotunnel.com ( currently not able to find it until creating a DNS CNAME )
  cloudflared tunnel create wowamazon-local
  cloudflared tunnel list

  ## delete tunnel
  # @note: A tunnel cannot be deleted if it has active connections.
  # @note: To delete it forcefully, `-f` can be used
  # @note: when the tunnel is deleted, the tunnel credential in /home/<user>/.cloudflared/<tunnel-uuid>.json will be removed as well.
  cloudflared tunnel delete wowamazon-local
  cloudflared tunnel delete wowamazon-local -f

  ## Get tunnel info
  cloudflared tunnel info wowamazon-local

Create Route - Routing Traffic through Public Hostname
------------------------------------------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/routing-to-tunnel/dns/
* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/configuration-file/

.. code-block:: bash

  ## create dns record with wildcard
  # @note: currently, the dns record can be removed only through Cloudflare dashboard
  # @note: the created dns entries can be seen only through Cloudflare dashboard
  cloudflared tunnel route dns wowamazon-local *.wowamazon.party

  ## create route ip
  # @note: Although the tunnel name doesn't match, it will still be created. - unexpected
  cloudflared tunnel route ip add 192.168.128.21/32 wowamazon-local

  ## delete route ip
  cloudflared tunnel route ip delete 192.168.128.21/32

  ## list / get route ip
  cloudflared tunnel route ip show
  cloudflared tunnel route ip list
  cloudflared tunnel route ip get 192.168.128.21


Run Cloudflare
--------------

.. code-block:: bash

  cloudflared tunnel run
  cloudflared tunnel --config /path/your-config-file.yml run


Deploy new Config with Replicas
-------------------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/configuration-file/#update-a-configuration-file


Run clound as service
---------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/as-a-service/linux/

.. code-block:: bash

  # TBD


References
----------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/tunnel-useful-commands/


