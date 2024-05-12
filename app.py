import json
import os
from datetime import datetime

from flask import (
    Flask,
    abort,
    flash,
    jsonify,
    make_response,
    redirect,
    render_template,
    request,
    session,
    url_for,
)
from werkzeug.utils import secure_filename

from db import handle_connection, handle_login, handle_register, load_movies
from decorators import login_required, logoff_required

app = Flask(__name__)
app.secret_key = os.environ.get("SECRET_KEY", "hhj3j9X8hAxYAgF1")
app.config["PROFILE_PIC_FOLDER"] = "static/profile_pics"


@app.route("/")
@login_required
def index():
    return redirect(url_for("dashboard"))


@app.route("/dashboard")
@login_required
def dashboard():
    user_details = handle_login.login_details(session.get("name"))
    if not user_details:
        abort(404)
    dashboard_content = load_movies.get_user_content(user_details)
    return render_template(
        "dashboard.html",
        user_object=user_details,
        dashboard_content=dashboard_content,
        curr_date=datetime.today().strftime("%A, %d %B %Y"),
    )


@app.route("/register", methods=["GET", "POST"])
@logoff_required
def register():
    if request.method == "POST":
        new_user = json.dumps(request.form)
        registered, err = handle_register.register_user(new_user)
        if err:
            flash(err, "error")
        if registered:
            flash(
                "Your account has been created. Now you are able to log in!",
                "success",
            )
            return redirect(url_for("login"))
        else:
            return redirect(url_for("register"))
    return render_template("register.html")


@app.route("/login", methods=["GET", "POST"])
@logoff_required
def login():
    if request.method == "POST":
        username = request.form["uname"]
        password = request.form["pwd"]
        logged_in, err = handle_login.login(username, password)
        if err:
            flash(err, "error")
        if logged_in:
            session["name"] = username
            return redirect(url_for("dashboard"))
        else:
            return render_template("login.html")
    return render_template("login.html")


@app.route("/movies/<int:movie_id>/like")
@login_required
def select_movies(movie_id):
    user_id = handle_login.login_details(session.get("name")).get("id", "")
    msg, category = load_movies.select_movies(user_id, movie_id)
    flash(msg, category)
    return redirect(url_for("dashboard"))


@app.route("/user/profile")
@login_required
def user():
    user_details = handle_login.login_details(session.get("name"))
    followers = len(handle_connection.get_followers(user_details.get("id")))
    following = len(handle_connection.get_following(user_details.get("id")))
    return render_template(
        "user-profile.html",
        user_details=user_details,
        followers=followers,
        following=following,
    )


@app.route("/user/following")
@login_required
def user_following():
    user_details = handle_login.login_details(session.get("name"))
    following = handle_connection.get_following(user_details.get("id"))
    return render_template("following.html", following=following)


@app.route("/user/followers")
@login_required
def user_followers():
    user_details = handle_login.login_details(session.get("name"))
    followers = handle_connection.get_followers(user_details.get("id"))
    following = handle_connection.get_following(user_details.get("id"))
    following_id_list = list(map(lambda x: x.get("id"), following))
    return render_template(
        "followers.html",
        followers=followers,
        following_id_list=following_id_list,
    )


@app.route("/user/follow/<username>")
@login_required
def follow_user(username):
    if username == session.get("name"):
        flash("You cannot perform this action!", "error")
        return redirect(url_for("user_following"))
    user_id = handle_login.login_details(session.get("name")).get("id")
    following_id = handle_login.login_details(username).get("id")
    msg, err = handle_connection.follow(user_id, following_id)
    flash(msg, err)
    return redirect(url_for("user_following"))


@app.route("/user/unfollow/<username>")
@login_required
def unfollow_user(username):
    user_id = handle_login.login_details(session.get("name")).get("id")
    following_id = handle_login.login_details(username).get("id")
    msg, err = handle_connection.unfollow(user_id, following_id)
    flash(msg, err)
    return redirect(url_for("user_following"))


@app.route("/user/edit", methods=["GET", "POST"])
@login_required
def edit_user():
    if request.method == "POST":
        data = dict(request.form)
        if "profile_pic" in request.files and request.files.get("profile_pic"):
            profile_pic = request.files.get("profile_pic")
            filename = secure_filename(profile_pic.filename)
            profile_pic.save(
                os.path.join(app.config["PROFILE_PIC_FOLDER"], filename)
            )
            data["profile_pic"] = filename
        is_updated, err = handle_register.update_user_profile(
            data, session.get("name", "")
        )
        if err:
            flash(err, "error")
        if is_updated:
            flash("Successfully updated profile!", "success")
            return redirect(url_for("user"))
        else:
            return redirect(url_for("edit_user"))
    user_details = handle_login.login_details(session.get("name"))
    return render_template("edit-user-profile.html", user_details=user_details)


@app.route("/logout/")
@login_required
def logout():
    session.clear()
    flash("Logged out successfully!", "success")
    return redirect(url_for("login"))


@app.route("/movies/")
@app.route("/movies/<string:category>")
@login_required
def movies(category="imdb"):
    user_details = handle_login.login_details(session.get("name"))
    movies = load_movies.load_movies(category)
    return render_template(
        "movies.html",
        movies=movies,
        category=category,
        user_object=user_details,
    )


@app.route("/movie/<string:category>/<int:id>")
@login_required
def movie_details(category, id):
    user_details = handle_login.login_details(session.get("name"))
    if id <= 0:
        abort(404)
    movie = load_movies.load_movies(category)[id - 1]
    return render_template(
        "movie-details.html",
        movie=movie,
        category=category,
        user_object=user_details,
    )


@app.route("/search/movies")
@login_required
def search_movies():
    title = request.args.get("title", None)
    category = request.args.get("category", "imdb")
    movies = load_movies.search_movie(category, title)
    return render_template("search.html", movies=movies, category=category)


# @app.route("/@<string:username>")
# def user_profile_shortcut(username):
#     return redirect(url_for('public_user_profile', username=username))
#
#
# @app.route("/users/@<string:username>")


@app.route("/@<string:username>")
def public_user_profile(username):
    user_details = handle_login.login_details(username)
    current_user = handle_login.login_details(session.get("name", ""))
    if not user_details:
        abort(404)
    user_id = user_details.get("id")
    followers = len(handle_connection.get_followers(user_id))
    following = len(handle_connection.get_following(user_id))
    movies_liked = load_movies.get_user_selected_movies(user_id)
    if current_user:
        following_list = handle_connection.get_following(current_user.get("id"))
        following_id_list = list(map(lambda x: x.get("id"), following_list))
        if current_user.get("username") == username:
            is_current_user = True
        else:
            is_current_user = False
    else:
        is_current_user = False
        following_id_list = []
    return render_template(
        "public-user-profile.html",
        user_details=user_details,
        followers=followers,
        following=following,
        following_id_list=following_id_list,
        movies_liked=movies_liked,
        is_current_user=is_current_user,
    )


@app.errorhandler(404)
def error(error):
    return render_template("404.html"), 404


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
