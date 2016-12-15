from tor_connect import tor_connect
import httplib
import socks
import socket
import os

def main():
	
	try:
		tor_connect()
	except:
		print("Error in connecting!!")
	else:
		print("Connected to tor")

	r=os.system('dig +short myip.opendns.com @resolver1.opendns.com')
	
	


main()
