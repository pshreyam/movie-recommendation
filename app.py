try:
    from dbconnect import (
        loadMovies,
        handleLogin,
        handleRegister,
        handleConnection,
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
            abort(404)
        dashboard_content = loadMovies.getUserContent(user_details)
        return render_template(
            'dashboard.html', 
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
                flash(
                    'Your account has been created. Now you are able to log in!',
                    'success'
                )
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


    @app.route('/movies/<int:movie_id>/like')
    @login_required
    def select_movies(movie_id):
        user_id = handleLogin.login_details(session.get('name')).get('id','')
        msg, category = loadMovies.selectMovies(user_id, movie_id)
        flash(msg, category)
        return redirect(url_for('dashboard'))


    @app.route('/user/profile')
    @login_required
    def user():
        user_details = handleLogin.login_details(session.get('name'))
        followers = len(handleConnection.get_followers(user_details.get('id')))
        following = len(handleConnection.get_following(user_details.get('id')))
        return render_template(
            'user-profile.html',
            user_details=user_details,
            followers=followers,
            following=following
        )

    @app.route('/user/following')
    @login_required
    def user_following():
        user_details = handleLogin.login_details(session.get('name'))
        following = handleConnection.get_following(user_details.get('id'))
        return render_template('following.html', following=following)


    @app.route('/user/followers')
    @login_required
    def user_followers():
        user_details = handleLogin.login_details(session.get('name'))
        followers = handleConnection.get_followers(user_details.get('id'))
        following = handleConnection.get_following(user_details.get('id'))
        following_id_list = list(map(lambda x:x.get('id'),following))
        return render_template(
            'followers.html', 
            followers=followers, 
            following_id_list=following_id_list)

    @app.route('/user/follow/<username>')
    @login_required
    def follow_user(username):
        if username == session.get('name'):
            flash('You cannot perform this action!','error')
            return redirect(url_for('user_following')) 
        user_id = handleLogin.login_details(session.get('name')).get('id')
        following_id = handleLogin.login_details(username).get('id')
        msg, err = handleConnection.follow(user_id, following_id)
        flash(msg , err)
        return redirect(url_for('user_following'))


    @app.route('/user/unfollow/<username>')
    @login_required
    def unfollow_user(username):
        user_id = handleLogin.login_details(session.get('name')).get('id')
        following_id = handleLogin.login_details(username).get('id')
        msg, err = handleConnection.unfollow(user_id, following_id)
        flash(msg , err)
        return redirect(url_for('user_following'))


    @app.route('/user/edit', methods=['GET','POST'])
    @login_required
    def edit_user():
        if request.method == 'POST':
            is_updated, err = handleRegister.updateUserProfile(request.form,session.get('name',''))
            if err:
                flash(err, 'error')
            if is_updated:
                flash('Successfully updated profile!', 'success')
                return redirect(url_for('user'))
            else:
                return redirect(url_for('edit_user'))
        user_details = handleLogin.login_details(session.get('name'))
        return render_template('edit-user-profile.html',user_details=user_details)


    @app.route('/logout/')
    @login_required
    def logout():
        session.clear()
        flash('Logged out successfully!','success')
        return redirect(url_for('login'))


    @app.route("/movies/")
    @app.route("/movies/<string:category>")
    @login_required
    def movies(category = "imdb"):
        user_details = handleLogin.login_details(session.get('name'))
        movies = loadMovies.loadMovies(category)
        return render_template(
            'movies.html',
            movies=movies, 
            category=category,
            user_object=user_details
        )


    @app.route("/movie/<string:category>/<int:id>")
    @login_required
    def movie_details(category, id):
        user_details = handleLogin.login_details(session.get('name'))
        if id <= 0:
            abort(404)
        movie = loadMovies.loadMovies(category)[id-1]
        return render_template(
            'movie-details.html',
            movie=movie,
            category=category,
            user_object=user_details
        )


    @app.route("/search/movies")
    @login_required
    def search_movies():
        title = request.args.get('title', None)
        category = request.args.get('category', 'imdb')
        movies = loadMovies.search_movie(category, title)
        return render_template('search.html', movies=movies, category=category)


    @app.route("/<string:username>")
    def user_profile_shortcut(username):
        return redirect(url_for('public_user_profile', username=username))

    @app.route("/users/<string:username>")
    def public_user_profile(username):
        user_details = handleLogin.login_details(username)
        current_user = handleLogin.login_details(session.get('name',''))
        if not user_details:
            abort(404)
        user_id = user_details.get('id')
        followers = len(handleConnection.get_followers(user_id))
        following = len(handleConnection.get_following(user_id))
        movies_liked = loadMovies.getUserSelectMovies(user_id)
        if current_user:
            following_list = handleConnection.get_following(current_user.get('id'))
            following_id_list = list(map(lambda x:x.get('id'), following_list))
            if current_user.get('username') == username:
                is_current_user = True
            else:
                is_current_user = False
        else:
            is_current_user = False
            following_id_list = []
        return render_template(
            'public-user-profile.html',
            user_details=user_details,
            followers=followers,
            following=following,
            following_id_list=following_id_list,
            movies_liked=movies_liked,
            is_current_user=is_current_user
        )

    @app.errorhandler(404)
    def error(error):
        return render_template("sorry.html"), 404


    if __name__ == "__main__":
        app.run(host='0.0.0.0' ,debug=True)


except Exception as exp:
    print(exp)
