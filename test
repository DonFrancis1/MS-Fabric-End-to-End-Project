DROP TABLE [WH].[dbo].[Customers];


--CTAS = CREATE TABLE AS SELECT STATEMENT
CREATE TABLE [FirstWarehouse].[dbo].[Covid-Data] AS
    SELECT 
            [id]
            ,[updated]
            ,[confirmed]
            ,[confirmed_change]
            ,[deaths]
            ,[deaths_change]
            ,[recovered]
            ,[recovered_change] 
FROM [dbo].[bing_covid-19_data];
