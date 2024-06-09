PostgreSQL
==========

Bring up PostgreSQL
-------------------

.. code-block:: bash

    docker-compose up -d


Connect by psql
---------------

.. code-block:: bash

    docker exec -it postgres_db psql -U exp-pg-user -d exp_pg


Create a table / Insert a record / Query to the table
-----------------------------------------------------

.. code-block:: sql

    -- create table
    CREATE TABLE cars (
      brand VARCHAR,
      model VARCHAR,
      year INT
    );

    -- query to cars table
    select * from cars;

    -- insert a row
    insert into cars values ('lexus','gx460',2023);



.. code-block:: bash

    python3 -m venv .venv
    source .venv/bin/activate
    pip install "psycopg[binary,pool]"