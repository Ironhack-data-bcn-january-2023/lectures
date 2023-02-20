import pandas as pd
from config.sql_connection import engine

def get_everything_table (table_q):
    query = f"SELECT * FROM  {table_q} LIMIT 10;"
    df = pd.read_sql_query(query, engine)
    return df.to_dict(orient="records")

def insert_one (the_table, d_id, name):
    query = f"""
    INSERT INTO {the_table}
        VALUES ("{d_id}", "{name}");
    """
    engine.execute(query)

def insert_params (id_, date, name, fname, gender, date_2):
    query = f"""
    INSERT INTO employees
    VALUES ("{id_}", "{date}", "{name}", "{fname}", "{gender}", "{date_2}");
    """
    engine.execute(query)


