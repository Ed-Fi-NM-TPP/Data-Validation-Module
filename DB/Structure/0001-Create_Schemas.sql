
/****** Object:  Schema [validation]    Script Date: 5/19/2017 4:35:52 PM ******/
CREATE SCHEMA [validation]
GO
/****** Object:  Schema [staging]    Script Date: 5/19/2017 4:35:52 PM ******/
CREATE SCHEMA [staging]
GO
CREATE USER [metricsUser] FOR LOGIN [metricsUser] WITH DEFAULT_SCHEMA=[validation]
GO
ALTER ROLE [db_datareader] ADD MEMBER [metricsUser]
GO
