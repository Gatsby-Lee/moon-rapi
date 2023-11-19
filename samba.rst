Samba
=====

Mounting an SMB Share on RPi
----------------------------

.. code-block:: bash

    # 0. Install dependent packages
    sudo apt-get install  samba-common smbclient samba-common-bin smbclient cifs-utils

    # 1. Create mount point in RPi
    # e.g.) sudo mkdir /mnt/media
    sudo mkdir /mnt/<name-to-mount>

    # 2. Mount
    sudo mount -t cifs //computer_name/share_name /mnt/smb_share
    sudo mount -t cifs -o username=<username> //computer_name/share_name /mnt/smb_share

    # To unmount


References
----------

* https://www.truenas.com/docs/core/coretutorials/sharing/smb/smbshare/
