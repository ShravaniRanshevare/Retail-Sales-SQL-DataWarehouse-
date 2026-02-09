import oracledb

DB_USER= "YOURUSERNAME"
DB_PASSWORD="PASSWORD"
DB_DSN="HOSTPORT"

def get_connection():
    return oracledb.connect(user=DB_USER,password=DB_PASSWORD,dsn=DB_DSN)

