/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW dbo.[Median Prices in SA]
AS
SELECT TOP (1000) LABEL AS Region, YEAR AS Year, Houses_0_number_of_transfers AS [House Transfers], CAST(Houses_0_median_sale_price AS int) AS [House Median Sale Price], 
                  Attached_Dwellings_0_number_of_transfers AS [Attached Dwelling Sales], CAST(Attached_Dwellings_0_median_sale_price AS int) AS [Attached Dwelling Median Price]
FROM     dbo.EconomicsandIndustry
WHERE  (LABEL IN
                      (SELECT DISTINCT e.LABEL
                       FROM      dbo.EconomicsandIndustry AS e CROSS JOIN
                                         dbo.PostcodeToLGA AS pc
                       WHERE   (e.LABEL LIKE pc.Region + '%') AND (pc.Postcode LIKE '5%'))) AND (YEAR = 2016)
