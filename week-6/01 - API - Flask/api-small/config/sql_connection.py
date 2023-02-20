import sqlalchemy as alch
import os 
from dotenv import load_dotenv
import pandas as pd

# Loading env variables
load_dotenv()
password = os.getenv("password_sql")

# Connection to database
dbName = "employees"
connectionData=f"mysql+pymysql://root:{password}@localhost/{dbName}"
engine = alch.create_engine(connectionData)