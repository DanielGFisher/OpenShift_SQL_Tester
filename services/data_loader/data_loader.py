import mysql.connector
import os

class DataLoader:
    """
    Recieves the data via a connection to the
    SQL data base and loads it
    """
    def __init__(self):
        self.conn = mysql.connector.connect(
            host=os.getenv("MYSQL_HOST"),
            user=os.getenv("MYSQL_USER"),
            password=os.getenv("MYSQL_PASSWORD"),
            database=os.getenv("MYSQL_DATABASE")
        )

def get_data(self):
    """
    :param self: Checks for dictionary and if valid cont.
    :return: Returns all as list of dictionaries
    """
    with self.conn.cursor(dictionary=True) as cursor:
        cursor.execute("SELECT * FROM data")
        return cursor.fetchall()