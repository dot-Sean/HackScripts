import socket
import socks
import httplib
from tor_connect import tor_connect


def new_identity():
	socks.setdefaultproxy()
	s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	s.connect(("127.0.0.1",9051))
	s.send("AUTHENTICATE\r\n")
	response=s.recv(128)
	if response.startswith("250"):
		s.send("SIGNAL NEWNYM\r\n")
	
	s.close()
	tor_connect()
