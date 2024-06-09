# Note: the module name is psycopg, not psycopg3
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
            # Execute a command: this creates a new table
            cur.execute("""
                CREATE TABLE cars (
                    brand VARCHAR,
                    model VARCHAR,
                    year INT
                );
                """)

            # Make the changes to the database persistent
            conn.commit()


if __name__ == "__main__":
    main()
