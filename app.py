try:
    from dbconnect import (
        loadMovies,
        searchMovies,
        handleLogin,
        handleRegister,
    )
    from flask import (
        Flask,
        redirect,
        url_for,
        render_template,
        request,
        session,
        make_response,
        jsonify,
        abort,
        flash,
    )
    import json
    from datetime import datetime
    from functools import wraps

    app = Flask(__name__)
    app.secret_key = "kjsd_!hfkjsdhfkjdsh"

    #ok
    def login_required(f):
        @wraps(f)
        def wrap(*args,**kwargs):
            if 'name' in session.keys():
                return f(*args,**kwargs)
            else:
                return redirect (url_for('login'))
        return wrap

    def logoff_required(f):
        @wraps(f)
        def wrap(*args,**kwargs):
            if 'name' not in session.keys():
                return f(*args,**kwargs)
            else:
                return redirect (url_for('index'))
        return wrap



    @app.route("/")
    @login_required
    def index():
        return redirect(url_for('dashboard'))



    @app.route("/dashboard")
    @login_required
    def dashboard():
        user_details = handleLogin.login_details(session.get('name'))
        if not user_details:
            return "<h1>Error</h1>"
        dashboard_content = loadMovies.getUserContent(user_details)
        return render_template('dashboard.html', 
            user_object = user_details ,
            dashboard_content = dashboard_content,
            curr_date = datetime.today().strftime("%A, %d %B %Y")
        )



    @app.route("/register", methods=['GET','POST'])
    @logoff_required
    def register():
        if request.method == "POST":
            new_user = json.dumps(request.form)
            registered, err = handleRegister.register_user(new_user)
            if err:
                flash(err, 'error')
            if registered:
                return redirect(url_for('login'))
            else:
                return redirect(url_for('register'))
        return render_template('register.html')



    @app.route("/login",methods=['GET','POST'])
    @logoff_required
    def login():
        if request.method=='POST':
            username = request.form['uname']
            password = request.form['pwd']
            logged_in, err = handleLogin.doLogin(username,password)
            if err:
                flash(err, 'error')
            if logged_in:
                session['name'] = username
                return redirect(url_for('dashboard'))
            else:
                return render_template('login.html')
        return render_template('login.html')
    
    @app.route('/like/<int:user_id>/<int:movie_id>')
    @login_required
    def select_movies(user_id, movie_id):
        loadMovies.selectMovies(user_id, movie_id)
        return redirect(url_for('dashboard'))



    @app.route('/user')
    @login_required
    def user():
        user_details = handleLogin.login_details(session.get('name'))
        return render_template('user-profile.html',user_details=user_details)

    
    @app.route('/user/edit', methods=['GET','POST'])
    @login_required
    def edit_user():
        if request.method == 'POST':
            isUpdated, err = handleRegister.updateUserProfile(json.dumps(request.form),session.get('name',''))
            if err:
                    flash(err, 'error')
            if isUpdated:
                flash('Successfully updated profile!', 'success')
                return redirect(url_for('user'))
            else:
                return redirect(url_for('edit_user'))
        user_details = handleLogin.login_details(session.get('name'))
        return render_template('edit-user-profile.html',user_details=user_details)



    #ok
    @app.route('/logout')
    @login_required
    def logout():
        session.clear()
        flash('Logged out successfully!','success')
        return redirect(url_for('login'))



    @app.route("/movies")
    @app.route("/movies/<string:category>")
    @login_required
    def movies(category = "imdb"):
        user_details = handleLogin.login_details(session.get('name'))
        movies = loadMovies.loadMovies(category)
        return render_template('movies.html',
                   movies=movies, 
                   category=category,
                   user_object=user_details)



    @app.route("/movie/<string:category>/<int:id>")
    @login_required
    def movie_details(category, id):
        user_details = handleLogin.login_details(session.get('name'))
        if id <= 0:
            abort(404)
        movie = loadMovies.loadMovies(category)[id-1]
        return render_template('movie-details.html',
                    movie=movie,
                    category=category,
                    user_object=user_details)



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



    #ok
    @app.errorhandler(404)
    def error(error):
        return render_template("sorry.html"), 404



    if __name__ == "__main__":
        app.run(host='0.0.0.0' ,debug=True)



except ImportError:
    print("Couldn't load modules.")
except Exception as exp:
    print(exp)
