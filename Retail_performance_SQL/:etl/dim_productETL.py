from etil_utils import read_csv,execute_many


DATA_PATH="/Users/shravaniranshevare1806/Library/CloudStorage/OneDrive-UniversityofHertfordshire/SQLProj/dim_product.csv"

def transform_row(rows:dict):
    return (rows["ProductName"],rows["Category"],rows["SubCategory"],
            rows["CostPerUnit"],rows["ProductKey"])

def main():
    data=read_csv(DATA_PATH)
    rows=[transform_row(r) for r in data]
    insert_sql="""INSERT INTO dim_product(ProductName,Category,Subcategory
                  ,CostPerUnit,ProductKey) VALUES(:1,:2,:3,:4,:5)"""
    execute_many(insert_sql,rows)
    
    
if __name__=="main":
    main()