from . import connect_to_db

def doLogin(username,password):
    username = username.lower()

    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)
    sql = f"SELECT * FROM user WHERE username = '{username}'"
    cursor.execute(sql)
    user_record = cursor.fetchone()

    if not user_record:
        return False, f"Invalid Credentials!"
    db_pass = user_record['pass']
    if not (password == db_pass):
        return False, f"Invalid Credentials!"

    conn.close()
    
    return True, None

def login_details(username):
    username = username.lower()

    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)
    sql = f"SELECT * FROM user WHERE username = '{username}'"
    cursor.execute(sql)
    user_record = cursor.fetchone()
    conn.close()

    return user_record

