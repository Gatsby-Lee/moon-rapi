import psycopg

USERNAME = "exp-pg-user"
DATABASE = "exp_pg"
PASSWORD = "yobro"


def main():
    # Connect to an existing database
    conninfo = f"postgresql://{USERNAME}:{PASSWORD}@localhost:5432/{DATABASE}"
    with psycopg.connect(conninfo) as conn:
        # Open a cursor to perform database operations
        with conn.cursor() as cur:
            # Query the database and obtain data as Python objects.
            cur.execute("SELECT * FROM cars")
            result = cur.fetchall()

            # You can use `cur.fetchmany()`, `cur.fetchall()` to return a list
            # of several records, or even iterate on the cursor
            for row in result:
                print(row)


if __name__ == "__main__":
    main()
