/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW dbo.IncomeByRegionSA
AS
SELECT TOP (100) PERCENT ato.["State or Territory"], pc.Region, ato.Postcode, ato.["Individuals 2003–04  no "], ato.["Median3 taxable income 2003–04  $"], ato.["Average3 taxable income 2003–04  $"], ato.["Individuals 2013–14  no "], 
                  ato.["Median3 taxable income 2013–14  $"], ato.["Average3 taxable income 2013–14  $"], ato.["Individuals 2014–15  no "], ato.["Median3 taxable income 2014–15  $"], ato.["Average3 taxable income 2014–15  $"], ato.["Individuals 2015–16  no "], 
                  ato.["Median3 taxable income 2015–16  $"], ato.["Average3 taxable income 2015–16  $"], ato.["Individuals 2016–17 no "], ato.["Median3 taxable income 2016–17 $"], ato.["Average3 taxable income 2016–17 $"]
FROM     dbo.ATOIncome AS ato INNER JOIN
                  dbo.PostcodeToLGA AS pc ON ato.Postcode = pc.Postcode
WHERE  (ato.Postcode IN
                      (SELECT DISTINCT Postcode
                       FROM      dbo.PostcodeToLGA AS pc)) AND (ato.["State or Territory"] = 'SA')
ORDER BY pc.Region
