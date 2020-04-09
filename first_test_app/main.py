from flask import Flask,render_template

app=Flask(__name__)

@app.route('/')
@app.route('/home')
def index():
    return render_template("index.html")

@app.route('/way')
def way():
    return "This is the way page."

@app.route('/profile/<name>')
def profile(name):
    return f"Hello {name}"

@app.route('/email/<int:id>')
def email(id):
    return f"Email sent to id: {id}"

@app.route('/insights/<name>')
def insights(name):
    return render_template("insights.html",name=name)

if __name__=="__main__":
    app.run(debug=True)