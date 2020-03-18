from .utils.string import isEmpty
import json
from . import connect_to_db


def register_user(user):
    conn = connect_to_db()
    cursor = conn.cursor()
    user = json.loads(user)

    userName = user.get('uname','').strip().lower()
    firstName = user.get('fname','').strip()
    lastName = user.get('lname','').strip()
    gender =user.get('gender','').strip()
    email = user.get('email','').strip()
    nationality = user.get('nation','').strip()
    password = user.get('pwd','').strip()
    repassword = user.get('repwd','').strip()

    if isEmpty(userName,firstName,lastName,gender,email,nationality,password,repassword):
        return False, "Fields Empty!"

    if not password == repassword:
        return False, "Passwords do not match!"
    
    sql = f"SELECT * FROM user WHERE username='{userName}'"

    cursor.execute(sql)
    existing_user = cursor.fetchone()
    if existing_user:
        print(existing_user)
        return False, "Username already exists!"

    sql =("INSERT INTO user (id, username, firstname," 
        "lastname, email, gender, pass, nationality) VALUES" 
        f"(NULL, '{userName}', '{firstName}', '{lastName}',"
        f" '{email}', '{gender}', '{password}'," 
        f" '{nationality}');")

    cursor.execute(sql)
    conn.commit()
    conn.close()

    return True, None

def updateUserProfile(user, uname):
    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)

    firstName = user.get('fname','').strip()
    lastName = user.get('lname','').strip()
    gender =user.get('gender','').strip()
    email = user.get('email','').strip()
    nationality = user.get('nation','').strip()

    if isEmpty(firstName, lastName, gender, email, nationality):
        return False, "Fields Empty!"

    sql = f"SELECT * FROM user WHERE username='{uname}'"

    cursor.execute(sql)
    existing_user = cursor.fetchone()
    if not existing_user:
        return False, "No such user!"

    sql =f""" UPDATE user 
        SET firstname='{firstName}',
        lastname='{lastName}', 
        email='{email}', 
        gender='{gender}',
        nationality='{nationality}' 
        WHERE username='{uname}'; """
    
    cursor.execute(sql)
    conn.commit()
    conn.close()

    return True, None

