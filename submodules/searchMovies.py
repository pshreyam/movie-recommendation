try:
    import mysql.connector
    from base64 import b64encode
except ImportError:
    print("Couldn't load modules...")

class Movies:
    def __init__(
        self,id,title,year,director,
        imdb,cast,synopsis,genre,image
        ,trailer_url,movie_url
        ):

        self.id = id
        self.title = title
        self.year = year
        self.director = director
        self.imdb = imdb
        self.cast = cast
        self.synopsis = synopsis
        self.genre = genre
        self.image = image
        self.trailer_url = trailer_url
        self.movie_url = movie_url
    
    def generate_content(self):
        return {
            'id' : self.id,
            'title' : self.title.strip(),
            'release_year' : int(self.year),
            'director' : self.director.strip(),
            'imdb_rating' : self.imdb,
            'cast' : self.cast.strip(),
            'image': b64encode(self.image).decode("utf-8"), 
            'synopsis' : self.synopsis.strip(),
            'genre' : self.genre.strip().split('/'),
            'trailer_url' : self.trailer_url.strip(),
            'movie_url' :self.movie_url.strip()
        }

    def __repr__(self):
        return f"<{self.title} id:{self.id}>"

conn = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password="",
    database = "recomovies"
)

def searchMovies(table_name,value):
    if value.strip()=="":
        return []
    cursor = conn.cursor()
    sql = f"SELECT * FROM {table_name} WHERE title  LIKE '%{value}%'"
    cursor.execute(sql)
    obj = cursor.fetchall()
    movies = []
    for row in obj:
        movies.append(Movies(
            row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7],row[8],row[9],row[10]
            )
        )
    return movies

def searchMoviesCategory():
    table_names=[]
    cursor = conn.cursor()
    sql = "SHOW TABLES"
    cursor.execute(sql)
    tables = cursor.fetchall()
    for table in tables:
        if table[0]!="user":
            table_names.append(table[0])
    return table_names


