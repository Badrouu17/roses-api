from pathlib import Path
from dotenv import load_dotenv
from routes import userRoute, authRoute
from mysql import mysql
from utils.errorHandler import error_handler
from werkzeug.exceptions import HTTPException

from flask import Flask
app = Flask(__name__)

env_path = Path('.') / '.env'
load_dotenv(
    dotenv_path=env_path)

with app.app_context():
    db = mysql.init_mysql()
    mysql.db = db

app.register_blueprint(
    authRoute.auth, url_prefix='/api/v1/auth')

app.register_blueprint(
    userRoute.user, url_prefix='/api/v1/user')

app.register_error_handler(
    HTTPException, error_handler)
