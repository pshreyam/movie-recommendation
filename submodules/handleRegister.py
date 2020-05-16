import mysql.connector as db

conn = db.connect(
	host = "localhost",
    user = "root",
    password="",
    database = "recomovies"
)

def isEmpty(*args):
	for arg in args:
		if arg.strip()=="":
			return True


def registerUser(user):
	cursor = conn.cursor()

	userName = user['userName'].strip().lower()
	firstName = user['firstName'].strip().title()
	lastName = user['lastName'].strip().title()
	gender = user['gender'].strip()
	email = user['email'].strip()
	nationality = user['nationality'].strip().upper()
	password = user['password'].strip()
	repassword = user['repassword'].strip()

	if isEmpty(userName,firstName,lastName,gender,email,nationality,password,repassword):
		return False,"Fields Empty!"

	if not password==repassword:
		return False,"Passwords do not match!"

	sql =("INSERT INTO user (id, username, firstname," 
		"lastname, email, gender, pass, nationality) VALUES" 
		f"(NULL, '{userName}', '{firstName}', '{lastName}',"
		f" '{email}', '{gender}', '{password}'," 
		f" '{nationality}');")
	
	cursor.execute(sql)
	conn.commit()
	return True,None