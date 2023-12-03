Cloudflare Tunnel Local Mgmt ( CLI )
====================================

Entities
--------

* Login
* Tunnel ( tunnel )
* DNS ( route dns
* Route IP ( route ip )
* Virtual Network ( vnet )

ref: https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/tunnel-useful-terms/


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

Create Configuration
--------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/configuration-file/
* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/origin-configuration/

.. code-block:: yaml

tunnel: <tunnel-uuid>
credentials-file: <credential-json-when-logged-in>

ingress:
  - hostname: wowamazon.party
    service: http://192.168.128.21:80
  # Rules can match the request's hostname to a wildcard character:
  - hostname: "*.wowamazon.party"
    service: http://192.168.128.21:80
  # Configuration files that contain ingress rules must always include a catch-all rule that concludes the file.
  - service: http_status:404


Create Route - Routing Traffic through Public Hostname
------------------------------------------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/routing-to-tunnel/dns/

.. code-block:: bash

  ## create dns record with wildcard
  # @note: currently, the dns record can be removed only through Cloudflare dashboard
  # @note: the created dns entries can be seen only through Cloudflare dashboard
  # @note: It will fail if the CNAME entry already exists.
  # @note: IMPORTANT: Unlike Cloudflare Dashboard, CLI approach requires manual DNS creation.
  cloudflared tunnel route dns wowamazon-local wowamazon.party
  cloudflared tunnel route dns wowamazon-local *.wowamazon.party


Run Cloudflare
--------------

.. code-block:: bash

  # @note: this is not a detached service.
  cloudflared tunnel run wowamazon-local
  cloudflared tunnel --config /path/your-config-file.yml run

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/tunnel-run-parameters/


Run clound as service
---------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/as-a-service/linux/

.. code-block:: bash

  # TBD



Deploy new Config with Replicas
-------------------------------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/configuration-file/#update-a-configuration-file


References
----------

* https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/tunnel-useful-commands/


