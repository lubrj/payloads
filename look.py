import socket, struct, cv2
import numpy as np
import mss

HOST = 'fxtun.dev'
PORT = 10008

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))

with mss.mss() as sct:
    monitor = sct.monitors[0]

    while True:
        img = sct.grab(monitor)
        frame = np.array(img)

        frame = cv2.cvtColor(frame, cv2.COLOR_BGRA2BGR)
        frame = cv2.resize(frame, (1280, 720))

        _, buffer = cv2.imencode('.jpg', frame, [int(cv2.IMWRITE_JPEG_QUALITY), 70])
        data = buffer.tobytes()

        message = struct.pack("Q", len(data)) + data
        s.sendall(message)
