import pymysql as mysql
import datetime

def connection():
    conn = mysql.connect(user='root',
                       password='root',
                       host='localhost',
                       database='Notown')
    cursor = conn.cursor()
    return conn, cursor

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

def check_password(username, password):
    conn, cursor = connection()
    cursor.execute("""SELECT * FROM users
                        WHERE username = %s AND password = %s""", (username, password))
    correct_password = cursor.fetchone()
    if not correct_password:
        return False
    else:
        return True

def get_receipt_id():
    conn, cursor = connection()
    cursor.execute("""SELECT COUNT(*) FROM receipt""")
    result = cursor.fetchone()
    cnt = int(result[0])

    cursor.close()
    conn.close()
    return cnt + 1

def get_user_id():
    conn, cursor = connection()
    cursor.execute("""SELECT COUNT(*) FROM users""")
    result = cursor.fetchone()
    cnt = int(result[0])

    cursor.close()
    conn.close()
    return cnt + 1

def get_credit_id():
    conn, cursor = connection()
    cursor.execute("""SELECT COUNT(*) FROM cards""")
    result = cursor.fetchone()
    cnt = int(result[0])

    cursor.close(); conn.close()
    return cnt + 1

def get_all_albums(page):
    if not page:
        page = 1

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

def id_from_username(username):
    conn, cursor = connection()
    cursor.execute("""SELECT user_id FROM users WHERE username = %s""", username)
    result = cursor.fetchone()
    cursor.close(); conn.close()
    return int(result[0])

def create_user(user_id, username, password, address, phone_number):
    conn, cursor = connection()
    cursor.execute("""INSERT INTO users (user_id, username, password, address, phone_number)
                        VALUES (%s, %s, %s,%s, %s) """,(user_id, username, password, address, phone_number))
    conn.commit(); cursor.close(); conn.close()
    return

def get_cards(username):
    conn, cursor = connection()
    cursor.execute("""SELECT cards.cc_id, cards.cc_number
                        FROM cards INNER JOIN users
                            ON cards.user_id=users.user_id
                        WHERE users.username = %s""", username)
    result = cursor.fetchall()
    lst = []
    for item in result:
        lst.append( [item[0], str('****' * 3) + item[1][-4:]] )
    cursor.close(); conn.close()
    return lst

def purchase(username, cart, cno):
    conn, cursor = connection()
    user_id = id_from_username(username)
    total = 0.00
    for album_id in cart:
        try:
            cursor.execute("""INSERT INTO purchases (user_id, album_id)
                                VALUES (%s, %s)""",(user_id, album_id))
            info = album_info(album_id)
            total += info["price"]
        except:
            print("Already Owned")
    total = total * 1.13
    recept_id = get_receipt_id()
    if total != 0.00:
        cursor.execute("""INSERT INTO receipt (r_id, price, user_id, purchased, cc_id)
                            VALUES (%s, %s, %s, %s, %s)""",(recept_id, total, user_id, datetime.datetime.now(), cno))
        conn.commit() 
    cursor.close(); conn.close()
    return

def create_credit(user_id, card_id, card_no, expiry, cv):
    conn, cursor = connection()
    card_no = card_no.replace("-",'')
    cursor.execute("""INSERT INTO cards (cc_id, cc_number, expiry, security_code, user_id)
                        VALUES (%s, %s, %s, %s, %s)""", (card_id, card_no, expiry, cv, user_id))
    conn.commit(); cursor.close(); conn.close()
    return

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
    print(cursor)
    result = cursor.fetchall()
    cursor.close(); conn.close()
    return result



