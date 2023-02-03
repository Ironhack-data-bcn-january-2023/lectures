import requests
from bs4 import BeautifulSoup # pip install beautifulsoup4
import pandas as pd
import requests
import re

def description (url):
    html = requests.get(url)
    soup = BeautifulSoup(html.content, "html.parser")
    description = soup.find_all("div", attrs = {"id": "description"})[0]

    return description.getText().strip()

def scrapping_sneakers ():

    url = "https://www.murallasport.com/29-zapatillas-moda-mujer"
    html = requests.get(url)
    soup = BeautifulSoup(html.content, "html.parser")
    
    # 1. Getting the name 
    tags_name = soup.find_all("div", attrs = {"class":"name_product_box"})
    names = [i.getText().strip() for i in tags_name]
    
    # 2. Getting the brand
    brand = soup.select("span.marca-product-box")
    list_brand = [i.getText().strip() for i in brand]
    
    # 3. Getting the price
    price = soup.find_all("div", {"class":"price_product_box"})
    prices = [i.getText().split("\n")[1].replace("€", "") for i in price]
    
    
    # 4. Getting the links for each items
    link = soup.find_all("div", attrs = {"class": "name_product_box"})
    links = [f"https://www.murallasport.com{i.span.a.get('href')}" for i in link]
    
    # 5. Description
    the_descriptions = [description(i) for i in links]
                             

    all_together = {
        "names": names,
        "brand": list_brand,
        "price": prices,
        "links": links,
        "descriptions": the_descriptions
    }

    df = pd.DataFrame(all_together)

    df.to_csv("../data/scrapped.csv")

scrapping_sneakers()