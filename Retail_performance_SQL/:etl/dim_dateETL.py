from etil_utils import read_csv,execute_many


DATA_PATH="/Users/shravaniranshevare1806/Library/CloudStorage/OneDrive-UniversityofHertfordshire/SQLProj/dim_product.csv"

def transform_row(rows:dict):
    return (rows["DateKey"],rows["Date"],rows["Year"],
            rows["Quarter"],rows["Month"],rows["DayOfWeek"])

def main():
    data=read_csv(DATA_PATH)
    rows=[transform_row(r) for r in data]
    insert_sql="""INSERT INTO dim_date(DateKey,Date,Year,Quarter,Month,DayOfWeek) VALUES(:1,:2,:3,:4,:5)"""
    execute_many(insert_sql,rows)
    
    
if __name__=="main":
    main()
