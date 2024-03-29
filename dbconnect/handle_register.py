from werkzeug.security import generate_password_hash

from .utils.string import isEmpty
import json
from . import connect_to_db


def register_user(user):
    conn = connect_to_db()
    cursor = conn.cursor()
    user = json.loads(user)

    user_name = user.get('uname', '').strip().lower()
    first_name = user.get('fname', '').strip()
    last_name = user.get('lname', '').strip()
    gender = user.get('gender', '').strip()
    email = user.get('email', '').strip()
    nationality = user.get('nation', '').strip()
    password = user.get('pwd', '').strip()
    repassword = user.get('repwd', '').strip()

    if isEmpty(user_name, first_name, last_name, gender, email, nationality, password, repassword):
        return False, "Fields Empty!"

    if not password == repassword:
        return False, "Passwords do not match!"

    hashed_password = generate_password_hash(password)

    sql = f"SELECT * FROM user WHERE username='{user_name}'"

    cursor.execute(sql)
    existing_user = cursor.fetchone()
    if existing_user:
        print(existing_user)
        return False, "Username already exists!"

    sql = ("INSERT INTO user (id, username, firstname,"
           "lastname, email, gender, pass, nationality) VALUES"
           f"(NULL, '{user_name}', '{first_name}', '{last_name}',"
           f" '{email}', '{gender}', '{hashed_password}',"
           f" '{nationality}');")

    cursor.execute(sql)
    conn.commit()
    conn.close()

    return True, None


def update_user_profile(user, uname):
    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)

    firstName = user.get('fname', '').strip()
    lastName = user.get('lname', '').strip()
    gender = user.get('gender', '').strip()
    email = user.get('email', '').strip()
    nationality = user.get('nation', '').strip()
    profile_pic = user.get('profile_pic', '').strip()

    if isEmpty(firstName, lastName, gender, email, nationality):
        return False, "Fields Empty!"

    sql = f"SELECT * FROM user WHERE username='{uname}'"

    cursor.execute(sql)
    existing_user = cursor.fetchone()
    if not existing_user:
        return False, "No such user!"

    sql = f"""UPDATE user 
        SET firstname='{firstName}',
        lastname='{lastName}', 
        email='{email}', 
        gender='{gender}',
        nationality='{nationality}'
        WHERE username='{uname}'; """

    cursor.execute(sql)
    
    if profile_pic:
        cursor.execute(f"UPDATE user SET profile_pic='{profile_pic}' WHERE username='{uname}';")

    conn.commit()
    conn.close()

    return True, None
