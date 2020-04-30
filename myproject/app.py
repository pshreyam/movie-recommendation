from flask import (
    Flask,
    redirect,
    url_for,
    render_template,
    request,
    session
)

app=Flask(__name__)
app.secret_key="kjsd_!hfkjsdhfkjdsh"

@app.route("/")
def index():
    if 'username' in session:
        return redirect(url_for('user'))
    return "Welcome to the Home Page.<br><a href='/login'>Login</a>"

@app.route("/login",methods=['GET','POST'])
def login():
    if 'username' in session:
        return redirect(url_for('user'))
    if request.method == 'POST':
        user={
            'username' : request.form['username'],
            'pwd' : request.form['password']
        }
        if user['username']=='admin' and user['pwd']=='admin':
            session['username']=user['username']
            return redirect(url_for('user'))
        return "<h1>Sorry</h1>"
    return render_template('index.html')

@app.route("/user")
def user():
    try:
        return render_template('user.html',user=session['username'])
    except Exception:
        return redirect(url_for('index'))

@app.route("/logout")
def logout():
    session.pop('username',None)
    return redirect(url_for("index"))



if __name__ == "__main__":
    app.run(host="0.0.0.0",debug=True)