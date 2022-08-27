from werkzeug.security import check_password_hash

from . import connect_to_db


def login(username, password):
    username = username.lower()

    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)
    sql = f"SELECT * FROM user WHERE username = '{username}'"
    cursor.execute(sql)
    user_record = cursor.fetchone()

    if not user_record:
        return False, "Invalid Credentials!"
    db_password = user_record['pass']
    if not check_password_hash(db_password, password):
        return False, "Invalid Credentials!"

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
