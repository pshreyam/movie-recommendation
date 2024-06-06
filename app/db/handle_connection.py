from . import connect_to_db


def get_followers(user_id):
    """
    Gets Followers For User.
    """
    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)
    sql = f"""SELECT * FROM `connect`,`user` WHERE `connect`.`follower`=`user`.`id` AND `connect`.`following`={user_id} ORDER BY connect_id"""
    cursor.execute(sql)
    followers = cursor.fetchall()
    conn.close()
    return followers


def get_following(user_id):
    """
    Gets People Followed By User.
    """
    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)
    sql = f"""SELECT * FROM `connect`,`user` WHERE `connect`.`following`=`user`.`id` AND `connect`.`follower`={user_id} ORDER BY connect_id"""
    cursor.execute(sql)
    following = cursor.fetchall()
    conn.close()
    return following


def follow(user_id, other_id):
    """
    Follows People With other_id for People With user_id.
    """
    if user_id == other_id:
        return "You cannot perform this action!", "error"
    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)
    sql = f"""SELECT * FROM connect
            WHERE follower = {user_id} AND following = {other_id} ORDER BY connect_id"""
    cursor.execute(sql)
    existing = cursor.fetchone()
    if existing:
        conn.commit()
        conn.close()
        return "Already followed user!", "info"
    sql = f"""INSERT INTO connect (follower, following) VALUES({user_id},{other_id})"""
    cursor.execute(sql)
    conn.commit()
    conn.close()
    return "Successfully followed user!", "success"


def unfollow(user_id, other_id):
    """
    Unfollows People With other_id for People With user_id.
    """
    if user_id == other_id:
        return "You cannot perform this action!", "error"
    conn = connect_to_db()
    cursor = conn.cursor(dictionary=True)
    sql = f"""SELECT * FROM connect
            WHERE follower = {user_id} AND following = {other_id} ORDER BY connect_id"""
    cursor.execute(sql)
    existing = cursor.fetchone()
    if not existing:
        conn.commit()
        conn.close()
        return "No user with that account!", "error"
    sql = f"""DELETE FROM connect
            WHERE follower = {user_id} AND following = {other_id}"""
    cursor.execute(sql)
    conn.commit()
    conn.close()
    return "Successfully unfollowed user!", "success"
