from flask import Blueprint, jsonify, request



bp = Blueprint('appuser', __name__, url_prefix='/appuser')