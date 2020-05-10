try:
    import mysql.connector
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

class MovieFunctions:
    def __init__(self, table_name):
        self.table_name = table_name
        self.id = self.getNewId()

    def getNewId(self):
        cursor = conn.cursor()
        sql = f"SELECT COUNT(id) FROM {self.table_name}"
        cursor.execute(sql)
        value = cursor.fetchall()[0][0]+1
        return value

    def addMovie(self,movie):
        cursor = conn.cursor()
        sql = (f"INSERT INTO {self.table_name} (id,title,year,director,imdb,cast,synopsis,genre,image,trailerurl,movieurl) "
        f"VALUES ({movie.id},'{movie.title}',{movie.year},'{movie.director}',"
        f"{movie.imdb},'{movie.cast}','{movie.synopsis}','{movie.genre}',"
        f"'{movie.image}','{movie.trailer_url}','{movie.movie_url}')")
        cursor.execute(sql)
        conn.commit()
    
    def deleteMovie(self,id):
        cursor = conn.cursor()
        sql = f"DELETE FROM {self.table_name} WHERE id={id}"
        cursor.execute(sql)
        conn.commit()

    def editMovieDetails(self,id,image
        ,trailer_url,movie_url):
        cursor = conn.cursor()
        sql = (f"UPDATE {self.table_name} SET trailerurl='{trailer_url}',"
            f" movieurl='{movie_url}', image='{image}'" 
            f" WHERE id={id}")
        cursor.execute(sql)
        conn.commit()
