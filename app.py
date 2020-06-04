try:
    from submodules import (
        loadMovies,
        searchMovies,
        handleLogin,
        handleRegister,
    )
except ImportError:
    print("Couldn't load module.")

from flask import (
    Flask,
    redirect,
    url_for,
    render_template,
    request,
    session,
    make_response
)

from functools import wraps

app = Flask(__name__)
app.secret_key = "kjsd_!hfkjsdhfkjdsh"


def login_required(f):
    @wraps(f)
    def wrap(*args,**kwargs):
        if 'name' in session.keys():
            return f(*args,**kwargs)
        else:
            return redirect (url_for('login'))
    return wrap


@app.route("/")
@login_required
def index():
    return redirect(url_for('movies'))

@app.route("/register",methods=['GET','POST'])
def register():
    if request.method=="POST":
        user = {
            'firstName' : request.form['fname'],
            'lastName' : request.form['lname'],
            'userName' : request.form['uname'],
            'gender' : request.form['gender'],
            'email' : request.form['email'],
            'nationality' : request.form['nation'],
            'password' : request.form['pwd'],
            'repassword' :request.form['repwd']
        }
        registered, err = handleRegister.registerUser(user)
        if registered:
            return redirect(url_for('login'))
        else:
            return render_template('register.html',error = err)
    return render_template('register.html',error = None)


@app.route('/logout')
@login_required
def logout():
    session.pop('name',None)
    return redirect(url_for('login'))

@app.route("/login",methods=['GET','POST'])
def login():
    if request.method=='POST':
        username = request.form['uname']
        password = request.form['pwd']
        logged_in, err = handleLogin.doLogin(username,password)
        if (logged_in):
            session['name'] = username
            return redirect(url_for('movies'))
        else:
            return render_template('login.html', error = err)
    return render_template('login.html', error = None)

@app.route("/movies")
@app.route("/movies/<category>")
@login_required
def movies(category = "imdb"):
    movies = loadMovies.loadMovies(category)
    return render_template('movies.html',movies=movies,category=category)


@app.route("/movie-details/<category>/<int:id>")
@login_required
def movie_details(category,id):
    movie = loadMovies.loadMovies(category)[id-1]
    return render_template('movie-details.html',movie=movie)

@app.route("/search",methods = ["GET","POST"])
@login_required
def search():
    searchResult = None
    searchCategory = None
    searchMovieCategory =sorted(['Imdb', 'Sports', 'Crime', 'Kids', 'Action']) 
    if request.method == "POST":
        searchItem = request.form['searchItem'].strip()
        searchCategory = request.form['searchCategory']
        searchResult = searchMovies.searchMovies(searchCategory,searchItem)
    return render_template("search.html",searchResult=searchResult,searchCategory=searchMovieCategory,currentCategory=searchCategory)

@app.errorhandler(404)
def error(error):
    return render_template("sorry.html"), 404

if __name__ == "__main__":
    app.run(debug=True)
