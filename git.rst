Git
===

Exclude a file from index ( like .env )
---------------------------------------

.. code-block:: bash

  # https://stackoverflow.com/questions/9750606/git-still-shows-files-as-modified-after-adding-to-gitignore
  git update-index --skip-worktree <filepath>
  git update-index --no-skip-worktree <filepath>
