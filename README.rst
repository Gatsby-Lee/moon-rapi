All about Raspberry Pi
======================

Raspberry Pi OS
---------------

.. code-block:: bash

  # To enable VNC / SSH
  sudo raspi-config


How to Create Private Repo with this repo as upstream?
------------------------------------------------------

.. code-block:: bash

  # 1. create private empty repo on github

  # 2. clone and push to new empty repo
  git clone --bare https://github.com/Gatsby-Lee/moon-rapi.git
  cd moon-rapi.git
  # push to https or ssh
  git push --mirror https://github.com/<username>/moon-rapi-private
  cd ..
  rm -rf moon-rapi.git

  # 3. clone
  git clone https://github.com/<username>/moon-rapi-private
  cd moon-rapi-private
  git remote add upstream https://github.com/Gatsby-Lee/moon-rapi.git
  git pull upstream main # Creates a merge commit
  git push origin main # push to private
