USE [master] 
GO 
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
GO 
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1 
GO 
EXEC master.dbo.sp_dropserver @server=N'XLSX_NewSheet', @droplogins='droplogins'
GO
EXEC sp_addLinkedServer
    @server= 'XLSX_NewSheet',
    @srvproduct = 'ACE 12.0',
    @provider = 'Microsoft.ACE.OLEDB.12.0',
    @datasrc = '\\Ped-udp_db\c$\Projects\NM\FlatFiles\1.xlsx',
    @provstr = 'Excel 12.0; HDR=Yes'

GO

USE NMReportMetrics 


SELECT * FROM OPENQUERY (XLSX_NewSheet, 'select * from [Per School$]')
