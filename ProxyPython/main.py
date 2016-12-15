from tor_connect import tor_connect
from new_identity import new_identity
import httplib
import socks
import socket
import os

def main():
	
	try:
		print("Old IP:")
		os.system('dig +short myip.opendns.com @resolver1.opendns.com')
		tor_connect()
	except:
		print("Error in connecting!!")
	else:
		print("Connected to tor")

	print("Identity after tor:")
	os.system('dig +short myip.opendns.com @resolver1.opendns.com')
	
	new_identity()
	
	print("New tor identity")
	os.system('dig +short myip.opendns.com @resolver1.opendns.com')
	


main()
