"""
Handles Connection And Interaction With Database! 
"""
import mysql.connector as db

def connect_to_db():
    config = {
        'host' : 'localhost',
        'user' : 'root',
        'password' : '',
        'database' : 'recomovies'
    }
    connection = db.connect(**config)
    return connection
