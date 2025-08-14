from fastapi import FastAPI
from services.data_loader.data_loader import DataLoader

app = FastAPI()
loader = DataLoader()

@app.get("/data")
def get_data():
    """
    Display data recieved on web-page
    :return: The data received in the DataLoader
    """
    return loader.get_data()