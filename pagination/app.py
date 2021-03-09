"""Basic Implementation of Pagination

This application uses the basic concepts of pagination.
"""

from flask import Flask, request, jsonify, render_template, abort
import mysql.connector

from settings import config

app = Flask(__name__)

def get_selected_movies(title):
    try:
        conn = mysql.connector.connect(**config)
        with conn.cursor(dictionary=True) as cursor:
            sql = f" SELECT title FROM imdb WHERE title LIKE '%{title}%' "
            cursor.execute(sql)
            movies_list = list(map(lambda x: x.get('title') ,cursor.fetchall()))
            return movies_list
    except Exception as e:
        print(e)
        abort(503)

def get_all_movies(page, limit):
    try:
        conn = mysql.connector.connect(**config)
        with conn.cursor(dictionary=True) as cursor:
            sql = f" SELECT * FROM imdb "
            cursor.execute(sql)
            movies_list = [(x.get('id'), x.get('title')) for x in cursor.fetchall()]
                    
            start_index = limit * (page - 1)
            end_index = limit * page 

            movies = movies_list[start_index:end_index]
            results = {} 
            results['movies'] = movies

            if end_index < len(movies_list):
                results['next'] = {
                "page": page + 1,
                "limit": limit
                }

            if start_index > 0:
                results['previous'] = {
                "page" : page - 1,
                "limit": limit
                }

            return results
    except Exception as e:
        print(e)
        abort(503)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/movies')
def movies():
    page = int(request.args.get('page' , 1))
    limit = int(request.args.get('limit', 5))
    if page < 1:
        return "Page no. cannot be less than 1...", 400
    return jsonify(get_all_movies(page, limit))

# @app.route('/movies/list')
# def movies_by_page():
#     page = int(request.args.get('page', 1))
#     limit = int(request.args.get('limit', 5))
#     if page < 1:
#         return "Page no. cannot be less than 1...", 400
#     result = get_all_movies(page, limit)
#     return render_template("movies.html" , result=result)

@app.route('/search')
def get_movie_by_title():
    return jsonify(get_selected_movies(request.args.get('title', None)))

@app.errorhandler(503)
def handle_error(err):
    return render_template("error.html"), 503

if __name__== "__main__":
    app.run(debug=True)
