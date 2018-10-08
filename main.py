from flask import Flask, render_template
from flask_socketio import SocketIO, emit
import os

app = Flask(__name__)
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'A_SECRET_KEY')
socketio = SocketIO(app)

@app.route('/')
def index():
    return render_template('index.html')


@socketio.on('click')
def broadcast_fireworks(message):
    emit('fireworks', message, broadcast=True)


if __name__ == '__main__':
    socketio.run(app)
