from flask import Flask, render_template, request, session, redirect, jsonify
import datetime, math
from functions import *
from functools import wraps

app = Flask(__name__)
app.secret_key = "CP363"

def login_required(f):
	@wraps(f)
	def decorated_function(*args, **kwargs):
		try:
			if session["username"] is not None:
				return f(*args, **kwargs)
		except:
			return redirect("/login")
	return decorated_function

@app.route("/")
@login_required
def index():
	result = my_albums(session["username"])
	return render_template("index.html", result=result)

@app.route("/login", methods=['POST','GET'])
def login():
	if request.method == "GET":
		return render_template("login.html", error=None)
	elif request.method == "POST":
		error = None
		username = request.form["username"]
		password = request.form["password"]

		#check if user exists
		if not user_exists(username):
			error = "User Does not Exist"
			return render_template("login.html", error=error)

		#check if right password
		if not check_password(username, password):
			error = "Incorrect Password"
			return render_template("login.html", error=error)

		if error is None:
			session["username"] = username
			session["cart"] = []
			return redirect("/")


@app.route("/register", methods=['POST','GET'])
def register():
	if request.method == "GET":
		return render_template("register.html", error=None)
	elif request.method == "POST":
		#Create User
		username = request.form["username"]
		password = request.form["password"]
		address = request.form["address"]
		phone = request.form["phone"]
		user_id = get_user_id()
		create_user(user_id, username, password, address, phone)

		#Add Payments
		card_no = request.form["card"]
		exp_mo = int(request.form["mm"])
		exp_yr = int('20' + request.form['yy'])
		exp_date = datetime.datetime(exp_yr, exp_mo, 1)
		cv = int(request.form["cv"])
		c_id = get_credit_id()
		create_credit(user_id, c_id, card_no, exp_date, cv)

		session["username"] = username
		session["cart"] = []
		return redirect("/")


@app.route("/search", methods=['POST','GET'])
def search():
	if request.method == "POST":
		search_str = request.form["search_str"]
		result = search_database(search_str)
		for res in result:
			print(res)
		return render_template("result.html", result=result, search=search_str)

	elif request.method == "GET":
		return render_template("result.html", result=None, search=None)

@app.route("/getCart", methods=['GET'])
def getCart():
	result = []
	try:
		cart = session["cart"]
		for item in cart:
			info = album_info(item)
			result.append(info)
		return jsonify(result)
	except:
		return (jsonify([]))
	

@app.route("/logout", methods=['POST', 'GET'])
def logout():
	session.pop("username", None)
	session.pop("cart", None)
	return redirect("/login")

@app.route("/addCart/<int:album_id>", methods=['POST'])
def addToCart(album_id):
	cart = session["cart"]
	if album_id not in cart:
		user_id = id_from_username(session["username"])
		if not user_owns(user_id, album_id):
			cart.append(album_id)
			session["cart"] = cart
			return jsonify({"status": 'Put in Cart'})
		else:
			return jsonify({"status": "already Owned"})
	else:
		return jsonify({"status": "already in cart"})

@app.route("/removeCart/<int:album_id>", methods=["POST"])
def removeFromCart(album_id):
	cart = session["cart"]
	if album_id in cart:
		cart.remove(album_id)
		session["cart"] = cart
		return jsonify({"status": 'Removed from Cart'})
	else:
		return jsonify({"status": "Not in cart"})

@app.route("/newCard", methods=['POST'])
def newCard():
	user_id = id_from_username(session["username"])
	card_no = request.form["card"]
	exp_mo = int(request.form["mm"])
	exp_yr = int('20' + request.form['yy'])
	exp_date = datetime.datetime(exp_yr, exp_mo, 1)
	cv = int(request.form["cv"])
	c_id = get_credit_id()
	create_credit(user_id, c_id, card_no, exp_date, cv)
	return redirect("/checkout")

@app.route("/getSongs/<int:album_id>")
def getSongs(album_id):
	conn, cursor = connection()
	cursor.execute("""SELECT Songs.song_title from songs WHERE Songs.album_id = %s""", album_id)
	result = cursor.fetchall()
	cursor.close(); conn.close()
	return jsonify(result)

@app.route("/checkout", methods=['POST','GET'])
def payment():
	username = session["username"]
	cards = get_cards(username)
	result = []
	cart = session["cart"]
	for item in cart:
		info = album_info(item)
		result.append(info)
	if request.method == "GET":
		return render_template("payment.html",cards=cards, cart=result)
	elif request.method == "POST":
		cno = request.form["cno"]
		if cno == '' or cno == None or cno == '':
			return render_template("payment.html",cards=cards, cart=result)
		else:
			purchase(username, cart, cno)
			session["cart"] = []
			return redirect("/")

@app.route("/all", strict_slashes=False)
@app.route("/all/<int:page>", strict_slashes=False)
def seeAll(page=1):
	result, count = get_all_albums(page)
	return render_template("/all.html",result=result, pages=math.ceil(count / 15))

if __name__ == "__main__":
	app.run(port=8000, debug=True)


