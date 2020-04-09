from flask import (
    Flask,
    render_template,
    Request,
    redirect,
    abort
) 
Flask,render_template,Request,redirect

app=Flask(__name__) 

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/mission")
def mission():
    return render_template("mission.html")




if __name__=="__main__":
    app.run(host='0.0.0.0',debug=True)
    #run through ip address followed by the port number
