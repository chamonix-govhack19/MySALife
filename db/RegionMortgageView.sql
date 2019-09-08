CREATE VIEW [dbo].[RegionMortgage] AS WITH recent AS (
    SELECT
        [LGACODE],
        label,
        year,
        RENT_MORTGAGE_PAYMENT_Average_monthly_household_mortgage_payment AS mortgage,
        ROW_NUMBER()
        OVER (PARTITION BY
                label
            ORDER BY
                year DESC) AS rownum
        FROM
            [familyCommunity]
        WHERE
            RENT_MORTGAGE_PAYMENT_Average_monthly_household_mortgage_payment IS NOT NULL
)
SELECT * FROM recent
WHERE rownum = 1;