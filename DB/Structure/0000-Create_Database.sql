USE master
 
--SET DB TO OFFLINE TO KICK USERS
IF EXISTS ( SELECT  1
            FROM    sys.databases
            WHERE   name = N'DataValidationDB' )
    BEGIN
        ALTER DATABASE [DataValidationDB]
        SET OFFLINE
        WITH ROLLBACK IMMEDIATE;
    END;

GO

--SET DB BACK ONLINE
IF EXISTS ( SELECT  1
            FROM    sys.databases
            WHERE   name = N'DataValidationDB' )
    BEGIN
        ALTER DATABASE [DataValidationDB]
        SET ONLINE
        WITH ROLLBACK IMMEDIATE;
    END;

GO

--DROP DB
IF EXISTS ( SELECT  1
            FROM    sys.databases
            WHERE   name = N'DataValidationDB' )
    BEGIN
        DROP DATABASE [DataValidationDB]
    END;

GO

CREATE DATABASE [DataValidationDB]
GO