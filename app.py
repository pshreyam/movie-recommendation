try:
    from submodules import loadMovies
    from submodules import searchMovies
except ImportError:
    print("Couldn't load loadMovies module.")

from flask import (
    Flask,
    redirect,
    url_for,
    render_template,
    request,
    session,
    make_response
)

app=Flask(__name__)
app.secret_key="kjsd_!hfkjsdhfkjdsh"

@app.route("/")
def index():
    return redirect(url_for('search'))

@app.route("/movies")
@app.route("/movies/<category>")
def movies(category="imdb"):
    movies = loadMovies.loadMovies(category)
    return render_template('movies.html',movies=movies,category=category)

@app.route("/movie-details/<category>/<int:id>")
def movie_details(category,id):
    movie = loadMovies.loadMovies(category)[id-1]
    return render_template('movie-details.html',movie=movie)

@app.route("/search",methods=["GET","POST"])
def search():
    searchResult = None
    searchCategory = None
    searchMovieCategory = searchMovies.searchMoviesCategory()
    if request.method == "POST":
        searchItem = request.form['searchItem'].strip()
        searchCategory = request.form['searchCategory']
        searchResult = searchMovies.searchMovies(searchCategory,searchItem)
    return render_template("search.html",searchResult=searchResult,searchCategory=searchMovieCategory,currentCategory=searchCategory)

@app.errorhandler(404)
def not_found(e):
    return render_template("sorry.html"), 404

if __name__ == "__main__":
    app.run(host="0.0.0.0",debug=True)
