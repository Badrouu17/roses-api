from flask import Blueprint
from controllers import roseController

rose = Blueprint(
    'rose', __name__)


rose.add_url_rule('/getAllRoses', 'getAllRoses',
                  roseController.getAllRoses, methods=['GET'])
