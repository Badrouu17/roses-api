from mysql.mysql import use_db
from flask import request as req, abort
from utils.response import res
from sql.roseQueries import getRoses


def getAllRoses():
    cnx = use_db()
    db = cnx.cursor()
    db.execute(getRoses())
    results = db.fetchall()

    return res(200, results)
