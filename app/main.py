import os

from flask import Flask

app = Flask(__name__)
app.secret_key = os.environ.get("SECRET_KEY")
app.config["PROFILE_PIC_FOLDER"] = "static/profile_pics"


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
