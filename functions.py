import pymysql as mysql
import datetime

#Initializes a MySQL Connection
def connection():
    conn = mysql.connect(user='root', password='root', host='localhost', database='Notown')
    cursor = conn.cursor()
    return conn, cursor

#Checks whether or not the user exists
def user_exists(username):
    conn, cursor = connection()
    cursor.execute("""SELECT * FROM users
                        WHERE username = %s""",username)
    exists = cursor.fetchone()
    cursor.close(); conn.close()
    if not exists:
        return False
    else:
        return True

#Checks the users Password 
def check_password(username, password):
    conn, cursor = connection()
    cursor.execute("""SELECT * FROM users
                        WHERE username = %s AND password = %s""", (username, password))
    correct_password = cursor.fetchone()
    cursor.close(); conn.close()
    if not correct_password:
        return False
    else:
        return True

#Gets Next ID for Receipt
def get_receipt_id():
    conn, cursor = connection()
    cursor.execute("""SELECT COUNT(*) FROM receipts""")
    result = cursor.fetchone()
    cursor.close(); conn.close()
    return int(result[0]) + 1

#Gets Next ID for User
def get_user_id():
    conn, cursor = connection()
    cursor.execute("""SELECT COUNT(*) FROM users""")
    result = cursor.fetchone()
    cursor.close(); conn.close()
    return int(result[0]) + 1

#Gets Next ID for Credit card
def get_credit_id():
    conn, cursor = connection()
    cursor.execute("""SELECT COUNT(*) FROM cards""")
    result = cursor.fetchone()
    cursor.close(); conn.close()
    return int(result[0]) + 1

#Creates user from the given parameters
def create_user(user_id, username, password, address, phone_number):
    conn, cursor = connection()
    cursor.execute("""INSERT INTO users (user_id, username, password, address, phone_number)
                        VALUES (%s, %s, %s,%s, %s) """,(user_id, username, password, address, phone_number))
    conn.commit(); cursor.close(); conn.close()
    return

#Returns all of the credit cards that belong to the user
def get_cards(username):
    conn, cursor = connection()
    cursor.execute("""SELECT cards.cc_id, cards.cc_number
                        FROM cards INNER JOIN users
                            ON cards.user_id=users.user_id
                        WHERE users.username = %s""", username)
    result = cursor.fetchall()
    lst = [[item[0], str('****' * 3) + item[1][-4:]] for item in result]
    cursor.close(); conn.close()
    return lst

#completes the purchase, creates receipt and ownership relation models
def purchase(username, cart, cno):
    conn, cursor = connection()
    user_id = id_from_username(username)
    recept_id = get_receipt_id()
    total = 0.00
    for album_id in cart:
        info = album_info(album_id)
        total += info["price"]
    if total != 0.00:
        total = total * 1.13
        cursor.execute("""INSERT INTO receipts (r_id, price, user_id, purchased, cc_id)
                            VALUES (%s, %s, %s, %s, %s)""",(recept_id, total, user_id, datetime.datetime.now(), cno))
        conn.commit() 
        for album_id in cart:
            cursor.execute("""INSERT INTO purchases (user_id, album_id, r_id)
                            VALUES (%s, %s, %s)""",(user_id, album_id, recept_id))
    conn.commit(); cursor.close(); conn.close()
    return

#Creates a credit card from the provided parameters
def create_credit(user_id, card_id, card_no, expiry, cv):
    conn, cursor = connection()
    card_no = card_no.replace("-",'')
    cursor.execute("""INSERT INTO cards (cc_id, cc_number, expiry, security_code, user_id)
                        VALUES (%s, %s, %s, %s, %s)""", (card_id, card_no, expiry, cv, user_id))
    conn.commit(); cursor.close(); conn.close()
    return

#returns the ID of a user via their username
def id_from_username(username):
    conn, cursor = connection()
    cursor.execute("""SELECT user_id FROM users WHERE username = %s""", username)
    result = cursor.fetchone()
    cursor.close(); conn.close()
    return int(result[0])

#Returns info about the album via a dictionary data type
def album_info(album_id):
    conn, cursor = connection()
    cursor.execute("""SELECT Albums.album_title, Albums.price, Musicians.name, Albums.album_id
                        FROM Albums 
                        INNER JOIN Musicians
                            ON Albums.producer_id=Musicians.sin
                        WHERE album_id = %s """, album_id)
    d = {}
    result = cursor.fetchone()
    d["title"] = result[0]
    d["price"] = float(result[1])
    d["artist"] = result[2]
    d["id"] = result[3]
    cursor.close(); conn.close()
    return d

#Searches the Database for the string entered into the function
def search_database(search_term):
    conn, cursor = connection()
    cursor.execute("""SELECT DISTINCT Albums.album_title, Albums.price, producer.name, Albums.album_id
                        FROM Perform
                            INNER JOIN Musicians
                                ON Perform.musician_id=Musicians.sin
                            INNER JOIN Albums
                                ON Perform.album_id=Albums.album_id
                            INNER JOIN Songs
                                ON Perform.song_id=Songs.song_id
                            LEFT JOIN Musicians as producer
                                ON Albums.producer_id=producer.sin
                            WHERE
                                (Musicians.name LIKE '{}' )
                                OR (producer.name LIKE '{}' )
                                OR (album_title LIKE '{}' )
                                OR (song_title LIKE '{}' )
        """.format(search_term, search_term, search_term,search_term ))
    result = cursor.fetchall()
    cursor.close(); conn.close()
    return result

#checks whether the user owns the album
def user_owns(user_id, album_id):
    conn, cursor = connection()
    cursor.execute("""SELECT * FROM purchases
                        WHERE user_id = %s AND album_id = %s""",(user_id, album_id))
    exists = cursor.fetchone()
    cursor.close(); conn.close()
    if not exists:
        return False
    else:
        return True

#returns all albums, page parameter allows pagination to not return too many
def get_all_albums(page):
    conn, cursor = connection()
    cursor.execute("""SELECT COUNT(*) from Albums""")
    count = cursor.fetchone(); count = int(count[0])
    start = (15 * (page - 1)); end = (15 * page)
    cursor.execute("""SELECT Albums.album_title, Albums.price, Musicians.name, Albums.album_id
                        FROM (Albums 
                            INNER JOIN Musicians
                                ON Albums.producer_id=Musicians.sin)
                        ORDER BY Albums.album_title ASC
                        LIMIT %s, %s""",(start, end))
    result = cursor.fetchall()
    cursor.close(); conn.close()
    return result, count
  

def my_albums(username):
    conn, cursor = connection()
    cursor.execute("""SELECT Albums.album_title, Albums.price, Musicians.name, Albums.album_id 
FROM purchases
    INNER JOIN users
        ON purchases.user_id=users.user_id
    INNER JOIN albums
        ON purchases.album_id=albums.album_id
    INNER JOIN Musicians
        ON albums.producer_id=Musicians.sin
    WHERE users.username = %s """, username)
    result = cursor.fetchall()
    cursor.close(); conn.close()
    return result

