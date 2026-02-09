from etl_utils import read_csv,execute_many

DATA_PATH="/Users/shravaniranshevare1806/Library/CloudStorage/OneDrive-UniversityofHertfordshire/SQLProj/dim_customer.csv"

def transform_row(row:dict):
    return (row["CustomerName"],row["Gender"],row["Age"],
            row["LoyaltyTier"],int(row["CustomerID"]) )

def main():
    data=read_csv(DATA_PATH)
    rows=[transform_row(r) for r in data]
    
    insert_sql=""" INSERT INTO dim_customer(CustomerName,Gender,Age,LoyaltyTier,CustomerID,)
                   VALUES(:1,:2,:3,:4,:5)"""
    execute_many(insert_sql,rows)
    
    
if __name__="main":
    main()
    
    