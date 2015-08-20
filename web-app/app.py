from flask import Flask, render_template, session
import random
import string
import subprocess

app = Flask(__name__)
app.config['DB'] = 'session.db'

def _id(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

def _connect():
    conn = sqlite3.connect(app.config['DB'])
    return conn

@app.route("/")
def index():
    return render_template("index.html",ip="192.168.0.100",port="7070")    

@app.route("/start")
def start():
    session['start'] = True
    session['id'] = _id()
    req_data = json.load(request.data)
    db_con = _connect()
    db_params = (session['id'], req_data['inputstream'],)
    db_con.execute("INSERT INTO session (ID, INPUTSTREAM) VALUES(?,?)", db_params)
    db_con.commit()
    db_con.close()
    
@app.route("/current_session")
def current_session():
    

@app.route("/stop")

if __name__ == "__main__":
    app.debug=True
    app.run(host='localhost',port='9090')
    