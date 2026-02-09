

import dim_custETL
import dim_productETL
import dim_dateETL
import dim_storeETL
import fact_salesETL


def main():
    print("Loading dim_customer...")
    dim_custETL.main()

    print("Loading dim_product...")
    dim_productETL.main()

    print("Loading dim_store...")
    dim_dateETL.main()

    print("Loading dim_date...")
    dim_storeETL.main()

    print("Loading fact_sales...")
    fact_salesETL.main()

    print("ETL complete.")


if __name__ == "__main__":
    main()
