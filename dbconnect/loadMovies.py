from base64 import b64encode
from . import connect_to_db


def loadMovies(table_name):
    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)
    sql = f"SELECT * FROM {table_name}"
    cursor.execute(sql)
    movies = cursor.fetchall()
    conn.close()
    for movie in movies:
        movie['image'] = b64encode(movie.get('image','')).decode("utf-8")
    return movies

def getUserContent(user):
    content = {}
    nationality = user.get('nationality','').lower() 
    gender = user.get('gender','')

    if nationality == 'nepalese' or nationality == 'nepali':
        content['primary'] = loadMovies('nepali')[:5]
        content['primary_category'] = 'Nepali'
    elif nationality == 'indian':
        content['primary'] = loadMovies('hindi')[:5]
        content['primary_category'] = 'Hindi'
    else:
        content['primary'] = loadMovies('imdb')[:5]
        content['primary_category'] = 'Imdb'

    if gender == 'M':
        content['secondary'] = loadMovies('action')[:5]
        content['secondary_category'] = 'Action'
    else:
        content['secondary'] = loadMovies('musical')[:5]
        content['secondary_category'] = 'musical'


    return content

