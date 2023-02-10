import matplotlib.pyplot as plt
import os

def basic_histogram (df):
    df["price"].hist()
    plt.axvline(x=df["price"].mean(), color="red")
    plt.savefig('data/hist.png')
    os.system("open data/hist.png")