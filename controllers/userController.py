from mysql.mysql import use_db
from flask import abort


def login():
    # cur = mysql.db.connection.cursor()
    db = use_db()
    db.execute('''SELECT * FROM users''')
    rv = db.fetchall()
    return str(rv)