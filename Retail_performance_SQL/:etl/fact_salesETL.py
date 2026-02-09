# etl/load_fact_sales.py

from etl_utils import read_csv, execute_many

DATA_PATH = "/Users/shravaniranshevare1806/Library/CloudStorage/OneDrive-UniversityofHertfordshire/SQLProj/dim_product.csv"


def transform_row(row: dict):
    return (
        int(row["FactSalesKey"]),
        int(row["SaleID"]),
        int(row["CustomerID"]),
        row["CustName"],
        int(row["DateKey"]),
        row["Date_sold"],          # e.g. "2/1/24" or "02/01/2024"
        int(row["ProductKey"]),
        row["Product"],
        int(row["StoreKey"]),
        row["Store"],
        float(row["Price"]),
        float(row["Discount"]),
        row["Region"],
        int(row["Quantity"])
    )


def main():
    data = read_csv(DATA_PATH)
    rows = [transform_row(r) for r in data]

    insert_sql = """
        INSERT INTO fact_sales (
            FactSalesKey, SaleID, CustomerID, CustName,
            DateKey, Date_sold,
            ProductKey, Product,
            StoreKey, Store,
            Price, Discount, Region, Quantity
        ) VALUES (
            :1, :2, :3, :4,
            :5, TO_DATE(:6, 'MM/DD/YY'),
            :7, :8,
            :9, :10,
            :11, :12, :13, :14
        )
    """

    execute_many(insert_sql, rows)


if __name__ == "__main__":
    main()
