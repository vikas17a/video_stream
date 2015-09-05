import socket
import time
import sys

HOST = ''
PORT = 9876
ADDR = (HOST,PORT)
BUFSIZE = 512

Vediofile = sys.argv[1]
serv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

serv.bind(ADDR)
serv.listen(5)

print 'listening ...'

while True:
  try:
  	conn, addr = serv.accept()
  	print 'client connected ... ', addr
  	file = open(Vediofile, 'rb')
  	while True:
  	  #time.sleep(0.001)
  	  data = file.read(BUFSIZE)
  	  if not data:
  	      break
  	  conn.send(data)
  	print 'finished writing file'
  	conn.close()
  	print 'client disconnected'
  except socket.error, v:
  	print 'client aborted connection'
