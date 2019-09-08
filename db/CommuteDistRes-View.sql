/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW CommuteDistanceResidenceKM AS (SELECT TOP (1000) [Label]
      ,[Average_commuting_distance_from_Place_of_Usual_Residence] AS 'Avg. Commute Distance from Residence (km)'
      ,[Median_commuting_distance_from_Place_of_Usual_Residence] AS 'Median Commute Distance from Residence (km)'
  FROM [govhackdb].[dbo].[familyCommunity]
  WHERE ([Year] = '2016')
  AND [Average_commuting_distance_from_Place_of_Usual_Residence] IS NOT NULL AND [Median_commuting_distance_from_Place_of_Usual_Residence] IS NOT NULL
  ORDER BY [Average_commuting_distance_from_Place_of_Usual_Residence] ASC)