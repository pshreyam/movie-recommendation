import mysql.connector as db

def connect_to_db():
    conn = db.connect(
        host = "localhost",
        user = "root",
        password= "",
        database = "recomovies"
    )
    return conn
