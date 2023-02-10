import sqlalchemy as alch
import pandas as pd
import os


def connection (dbName):
    connectionData=f"mysql+pymysql://root:password@localhost/{dbName}" # don't do this 🫠
    engine = alch.create_engine(connectionData)
    return engine

def insert (df, table_name, dbName):
    os.system("say inserting into the database")
    engine = connection (dbName)
    df.to_sql(table_name, con=engine, if_exists="append", index=False)
    print("CONNECTION ESTABLISHED")

def select (table_name, dbName):
    engine = connection (dbName)
    df = pd.read_sql_query(f"""
        SELECT * 
            FROM {table_name};
        """, engine)

    feedback =  f"These many rows are in the table right now: {df.shape[0]}"
    print (feedback)
    return feedback