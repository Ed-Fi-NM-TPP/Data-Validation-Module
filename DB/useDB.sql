USE [master]
GO
IF EXISTS ( SELECT  1
            FROM    sys.databases
            WHERE   name = N'DataValidationDB' )
    BEGIN
        USE [DataValidationDB]
    END
GO