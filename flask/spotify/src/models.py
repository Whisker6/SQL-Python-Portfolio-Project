from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

class User(db.Model):
    def __init__(self, username: str, password: str):
        self.username = username
        self.password = password

    __tablename__ = 'appuser'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(128), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)