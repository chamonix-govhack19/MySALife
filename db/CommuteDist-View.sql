/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW CommuteDistance AS (SELECT TOP (1000) [Label]
      ,[Average_commuting_distance_to_place_of_work] AS 'Avg. Commute Distance (km)'
      ,[Median_commuting_distance_to_place_of_work] AS 'Median Commute Distance (km)'
  FROM [govhackdb].[dbo].[familyCommunity]
  WHERE [Year] = '2016'
  AND [Average_commuting_distance_to_place_of_work] IS NOT NULL AND [Median_commuting_distance_to_place_of_work]IS NOT NULL
  ORDER BY [Average_commuting_distance_to_place_of_work] ASC)