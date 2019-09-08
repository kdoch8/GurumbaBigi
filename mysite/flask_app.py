
# A very simple Flask Hello World app for you to get started with...

from flask import Flask, render_template, request, redirect, url_for, flash
from flaskext.mysql import MySQL
import urllib.request

app = Flask(__name__)
app.secret_key = "flash_message"

app.config['MYSQL_DATABASE_HOST'] = 'GurumbaBigi.mysql.pythonanywhere-services.com'
app.config['MYSQL_DATABASE_USER'] = 'GurumbaBigi'
app.config['MYSQL_DATABASE_PASSWORD'] = 'eyesearsmouth'
app.config['MYSQL_DATABASE_DB'] = 'GurumbaBigi$govhack'

mysql = MySQL()
mysql.init_app(app)

greetings =	{
    "english": "G'day",
    "butchulla": "Galangoor D'Buthbee",
    "dharumbal": "Gudamulli",
    "duungidjawu": "Galang meng",
    "gooreng_gooreng": "Balka wittaberri",
    "gunggari": "Migany duru",
    "kala_kawaw_ya": "Ngi midh",
    "ku_ku_yalanji": "Ngulkurr warngku",
    "turubul": "Galang nguruindhau",
    "wakka_wakka": "Galang ngunar",
    "yugambeh": "Baugull nyungai",
    "yugarabul": "Gurumba bigi",
    "yuggera": "Gurumba bigi",
    "yuwaalaraay": "Gaba yaadha"
}






currlang="english"
langselect="English"

@app.route('/')
@app.route('/index')
def index():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html', greeting=greetings["english"],currlang="english" ,langselect="English",bodyparts=data)
    '''
    url = 'https://www.data.qld.gov.au/api/3/action/datastore_search?resource_id=ebd00c34-d5d1-4266-8f6b-d9424104a307&limit=5'
    fileobj = urllib.request.urlopen(url)
    return render_template('index.html', data=fileobj.read())
'''


@app.route('/butchulla')
def butchulla():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["butchulla"],currlang="butchulla" ,langselect="Butchulla",bodyparts=data)

@app.route('/dharumbal')
def dharumbal():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["dharumbal"],currlang="dharumbal" ,langselect="Dharumbal",bodyparts=data )

@app.route('/duungidjawu')
def duungidjawu():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["duungidjawu"],currlang="duungidjawu",langselect="Duungidjawu" ,bodyparts=data )

@app.route('/gooreng_gooreng')
def gooreng_gooreng():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["gooreng_gooreng"],currlang="gooreng_gooreng",langselect="Gooreng Gooreng" ,bodyparts=data )

@app.route('/gunggari')
def gunggari():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["gunggari"],currlang="gunggari",langselect="Gunggari" ,bodyparts=data )

@app.route('/kala_kawaw_ya')
def kala_kawaw_ya():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["kala_kawaw_ya"],currlang="kala_kawaw_ya",langselect="Kala Kawaw Ya" ,bodyparts=data )

@app.route('/ku_ku_yalanji')
def ku_ku_yalanji():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["ku_ku_yalanji"],currlang="ku_ku_yalanji",langselect="Ku Ku Yalanji"  ,bodyparts=data)

@app.route('/turubul')
def turubul():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["turubul"],currlang="turubul" ,langselect="Turubul" ,bodyparts=data)

@app.route('/wakka_wakka')
def wakka_wakka():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["wakka_wakka"],currlang="wakka_wakka",langselect="Wakka Wakka" ,bodyparts=data )

@app.route('/yugambeh')
def yugambeh():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["yugambeh"],currlang="yugambeh",langselect="Yugambeh"  ,bodyparts=data)

@app.route('/yugarabul')
def yugarabul():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["yugarabul"],currlang="yugarabul",langselect="Yugarabul" ,bodyparts=data )

@app.route('/yuggera')
def yuggera():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["yuggera"],currlang="yuggera",langselect="Yuggera"  ,bodyparts=data)

@app.route('/yuwaalaraay')
def yuwaalaraay():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute('SELECT * FROM bodyparts')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',greeting=greetings["yuwaalaraay"],currlang="yuwaalaraay",langselect="Yuwaalaraay" ,bodyparts=data )

@app.route('/credits')
def credits():
    return render_template('credits.html')


