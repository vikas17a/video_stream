from flask import Flask, render_template
import random
import string
import subprocess
import config.parser

app = Flask(__name__)

def _id(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

@app.route("/")
def index():
    return render_template("index.html",ip="",port="7070")

@app.route("/start")
def start():

    
@app.route("/current_session")
def current_session():
    

@app.route("/stop")

if __name__ == "__main__":
    app.debug=True
    app.run(host='localhost',port='9090')
    
