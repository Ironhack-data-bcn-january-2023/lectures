import src.scraper as scraper
import src.sql_database as db
import pandas as pd
import src.visualization as viz

dbName = "shoes"
table_name = "shoes"

# 1. Extraction
#df = scraper.scrapping_sneakers()
df = pd.read_csv("data/scrapped.csv")

# 2. Connection & loading
db.connection(dbName)

# 3. Insert the table
db.insert(df, table_name, dbName)

# 4. Selecting
db.select (table_name, dbName)

# 5. Plotting
viz.basic_histogram(df)



