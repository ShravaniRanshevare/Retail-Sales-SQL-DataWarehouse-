import csv
from typing import List,Tuple
from db_config import get_connection

def read_csv(filepath:str)->List[dict]:
    with open(filepath,mode="r",encoding="utf-8-sig") as f:
        reader=csv.DictReader(f)
        return list(reader)
    
def execute_many(query:str,rows:List[Tuple]):
    conn=get_connection
    try:
        with conn.cursor() as cur:
            cur.executemany(query,rows)
        conn.commit()
        print(f"Inserted {len(rows)} rows.")
    finally:
        conn.close()