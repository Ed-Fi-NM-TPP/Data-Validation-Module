SET IDENTITY_INSERT [validation].[Rule] ON 

GO
INSERT [validation].[Rule] ([RuleId], [Name], [Description], [Expression], [OutputMessage]) VALUES (1, N'Incorrect number of charactErs ', N'If the length of the value doesn''t match the length of value on the data validation rules', N'CASE WHEN minLength IS NULL AND LEN(REPLACE_ME_COLUMN) != [ExpectedLength] THEN ''REPLACE_ME_MESSAGE'' WHEN minLength IS NOT NULL AND LEN(REPLACE_ME_COLUMN) NOT BETWEEN minLength AND ExpectedLength THEN ''REPLACE_ME_MESSAGE'' ELSE '''' END', N'Incorrect number of characters')
GO
INSERT [validation].[Rule] ([RuleId], [Name], [Description], [Expression], [OutputMessage]) VALUES (2, N'Incorrect property type', N'If the property type of the field on the file doesn''t match what the client provides on the data validation rules', N'CASE WHEN [ExpectedType] IS NOT NULL AND REPLACE_ME_COLUMN IS NOT NULL AND ( CASE WHEN UPPER([ExpectedType]) = ''INTEGER'' AND ISNUMERIC(REPLACE_ME_COLUMN) = 0 THEN 1 WHEN UPPER([ExpectedType]) IN( ''DATETIME'',''DATE'') AND ISDATE(REPLACE_ME_COLUMN) = 0 THEN 1 WHEN UPPER([ExpectedType]) = ''STRING'' THEN 0 ELSE 0 END ) = 1 THEN ''REPLACE_ME_MESSAGE'' ELSE '''' END', N'Incorrect property type')
GO
INSERT [validation].[Rule] ([RuleId], [Name], [Description], [Expression], [OutputMessage]) VALUES (3, N'Value not allowed', N'If the value on the file is not in the list of enumerations', N'CASE WHEN [ExpectedValues] IS NOT NULL AND REPLACE_ME_COLUMN IS NOT NULL AND ((COALESCE(REPLACE_ME_COLUMN,'''') NOT IN ( REPLACE_ME_EXPECTED_VALUES ) ) OR (CHARINDEX('' to '', [ExpectedValues]) > 0 AND (CASE WHEN ISNUMERIC(REPLACE_ME_COLUMN) = 1 AND ((CHARINDEX(''.'', REPLACE_ME_COLUMN) > 0 AND LEN(REPLACE_ME_COLUMN) > 1) OR (CHARINDEX(''.'', REPLACE_ME_COLUMN) < 1 AND REPLACE_ME_COLUMN NOT IN( ''-'',''+'') )) THEN REPLACE_ME_COLUMN ELSE CAST(CASE WHEN CHARINDEX(''.'', REPLACE_ME_COLUMN) > 0 THEN ''-1.0'' ELSE ''-1'' END AS NUMERIC) END) NOT BETWEEN REPLACE_ME_BETWEEN_VALUES ) OR NOT (ISNUMERIC(REPLACE_ME_COLUMN) != 1 OR CHARINDEX('' to '', [ExpectedValues]) > 0 OR ((CHARINDEX(''>'', [ExpectedValues]) > 0 OR CHARINDEX(''<'', [ExpectedValues]) > 0) AND (CASE WHEN ISNUMERIC(REPLACE_ME_COLUMN) = 1 AND ((CHARINDEX(''.'', REPLACE_ME_COLUMN) > 0 AND LEN(REPLACE_ME_COLUMN) > 1) OR (CHARINDEX(''.'', REPLACE_ME_COLUMN) < 1 AND REPLACE_ME_COLUMN NOT IN( ''-'',''+'') )) THEN REPLACE_ME_COLUMN ELSE CAST(CASE WHEN CHARINDEX(''.'', REPLACE_ME_COLUMN) > 0 THEN ''-1.0'' ELSE ''-1'' END AS NUMERIC) END) REPLACE_ME_GTE_VALUES))) THEN ''REPLACE_ME_MESSAGE'' ELSE '''' END', N'Value not allowed')
GO
INSERT [validation].[Rule] ([RuleId], [Name], [Description], [Expression], [OutputMessage]) VALUES (4, N'Duplicate teacher candidate', N'If a teacher candidate is on the file more than once based on last 5 of SSN and birth date', N'CASE WHEN ( SELECT  COUNT(*) FROM staging.REPLACE_ME_TEMPLATE B WHERE REPLACE_ME_PRIMARY_KEY_FLTER GROUP BY REPLACE_ME_PRIMARY_KEY_FIELD) > 1 THEN ''REPLACE_ME_MESSAGE''  ELSE '''' END', N'Duplicate Record')
GO
INSERT [validation].[Rule] ([RuleId], [Name], [Description], [Expression], [OutputMessage]) VALUES (5, N'Required field missing', N'If the field is required and the value is missing on the file', N'CASE WHEN [isRequired] = 1 AND ( REPLACE_ME_COLUMN IS NULL OR LEN(LTRIM(RTRIM(REPLACE_ME_COLUMN))) < 1) THEN ''REPLACE_ME_MESSAGE'' ELSE '''' END', N'Required field missing')
GO
INSERT [validation].[Rule] ([RuleId], [Name], [Description], [Expression], [OutputMessage]) VALUES (6, N'Incorrect format', N'If the format of the value doesn''t match the format of value on the data validation rules', N' CASE WHEN [ExpectedFormat] IS NOT NULL AND LTRIM(RTRIM(REPLACE_ME_COLUMN)) != FORMAT(CAST(REPLACE_ME_COLUMN AS DATE),[ExpectedFormat]) THEN ''REPLACE_ME_MESSAGE'' ELSE '''' END', N'Incorrect Format')
GO
SET IDENTITY_INSERT [validation].[Rule] OFF
GO
SET IDENTITY_INSERT [validation].[TemplateField] ON 

GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (13, N'Admissions', N'Candidate ACT', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'Integer', N'1 to 36', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (11, N'Admissions', N'Candidate Admission Status', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'String', N'''Not Fully Admitted''
,''Fully Admitted''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (12, N'Admissions', N'Candidate Admitting GPA', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'Integer', N'0.00 to 4.00', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (8, N'Admissions', N'Candidate Birth Date', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'Datetime ', NULL, NULL, NULL, N'yyyy/MM/dd')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (9, N'Admissions', N'Candidate Ethnicity', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'String', N'''American Indian''
,''Asian''
,''Black''
,''Hispanic''
,''Non-Res Alien''
,''Multi-Ethnic''
,''White''
,''Not Selected''
,''Other''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (5, N'Admissions', N'Candidate First Name', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (10, N'Admissions', N'Candidate Gender', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', N'''Female''
,''Male''
,''F''
,''M''
,''Not Selected''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (4, N'Admissions', N'Candidate Last Name', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (6, N'Admissions', N'Candidate Middle Initial', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (14, N'Admissions', N'Candidate SAT', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'Integer', N'400 to 1600', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (7, N'Admissions', N'Candidate SSN', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'String', NULL, NULL, 5, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (28, N'Admissions', N'Expected Program1 End Month', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'Integer', N'1 to 12', 1, 2, N'MM')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (29, N'Admissions', N'Expected Program1 End Year', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'Integer', N'>= 2016', NULL, 4, N'yyyy')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (15, N'Admissions', N'Has Passed Essential Skills Subtest I', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (17, N'Admissions', N'Has Passed Essential Skills Subtest II', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (19, N'Admissions', N'Has Passed Essential Skills Subtest III', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (2, N'Admissions', N'Institution ID', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'String', NULL, NULL, 2, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (3, N'Admissions', N'InstitutionName', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (32, N'Admissions', N'Other Minor1', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (33, N'Admissions', N'Other Minor2', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (24, N'Admissions', N'Program Area1', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', N'''Elementary''
,''Special Education''
,''Secondary''
,''Early Childhood''
,''Health''
,''PE''
,''Art''
,''Other''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (21, N'Admissions', N'Program Type', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'String', N'''Traditional undergraduate''
,''Alternative undergraduate''
,''Traditional graduate''
,''Alternative graduate''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (26, N'Admissions', N'Program1 Start Month', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'Integer', N'1 to 12', 1, 2, N'MM')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (27, N'Admissions', N'Program1 Start Year', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 1, N'Integer', N'>=2015', NULL, 4, N'yyyy')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (25, N'Admissions', N'Program1 Subject Area1 ', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (22, N'Admissions', N'Program1 Subject Area2', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (23, N'Admissions', N'Program2 Area', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (16, N'Admissions', N'Score Subtest I', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (18, N'Admissions', N'Score Subtest II', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (20, N'Admissions', N'Score Subtest III', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (30, N'Admissions', N'TESOL/Bilingual Minor1', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (31, N'Admissions', N'TESOL/Bilingual Minor2', N'[Candidate SSN],[Candidate Birth Date]', N'[Candidate Last Name],[Candidate First Name],[Candidate Middle Initial]', N'A.[Candidate SSN] = B.[Candidate SSN] AND A.[Candidate Birth Date] = B.[Candidate Birth Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (52, N'Completers', N'Alternative_Internship_Year_School_1', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'''Yes''
,''No''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (58, N'Completers', N'Alternative_Internship_Year_School_2', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'''Yes''
,''No''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (64, N'Completers', N'Alternative_Internship_Year_School_3', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'''Yes''
,''No''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (40, N'Completers', N'Completer_Birth_Date', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'Datetime', NULL, NULL, NULL, N'yyyy/MM/dd')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (41, N'Completers', N'Completer_Ethnicity', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', N'''American Indian''
,''Asian''
,''Black''
,''Hispanic''
,''Non-Res Alien''
,''Multi-Ethnic''
,''White''
,''Not Selected''
,''Other''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (37, N'Completers', N'Completer_First_name', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (42, N'Completers', N'Completer_Gender', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', N'''Female''
,''Male''
,''F''
,''M''
,''Not Selected''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (36, N'Completers', N'Completer_Last_Name', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (38, N'Completers', N'Completer_Middle_Initial', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (51, N'Completers', N'CT_First_Name_1', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (57, N'Completers', N'CT_First_Name_2', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (63, N'Completers', N'CT_First_Name_3', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (50, N'Completers', N'CT_Last_Name_1', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (56, N'Completers', N'CT_Last_Name_2', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (62, N'Completers', N'CT_Last_Name_3', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (67, N'Completers', N'Expected Program1 End Month', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'Integer', N'1 to 12', 1, 2, N'MM')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (78, N'Completers', N'Expected Program1 End Year', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'Integer', N'>=2013', NULL, 4, N'yyyy')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (79, N'Completers', N'Graduated', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', N'''Yes''
,''No''
,''N/A''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (46, N'Completers', N'Graduating_GPA', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'Integer', N'0.00 to 4.00', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (55, N'Completers', N'Hours_Student_Teaching_School_2', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'Integer', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (61, N'Completers', N'Hours_Student_Teaching_School_3', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'Integer', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (34, N'Completers', N'Institution_ID', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (35, N'Completers', N'Institution_Name', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (81, N'Completers', N'Licensure_completion', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', N'''Yes'',''No'',''N/A''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (75, N'Completers', N'Other Minor1', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (76, N'Completers', N'Other Minor2', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (69, N'Completers', N'Program Area1', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', N'''Elementary''
,''Special Education''
,''Secondary''
,''Early Childhood''
,''Health''
,''PE''
,''Art''
,''Other''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (68, N'Completers', N'Program Type', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', N'''Traditional undergraduate''
,''Alternative undergraduate''
,''Traditional graduate''
,''Alternative graduate''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (66, N'Completers', N'Program1 Start Month', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'Integer', N'1 to 12', 1, 2, N'MM')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (77, N'Completers', N'Program1 Start Year', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'Integer', N'>=2012', NULL, 4, N'yyyy')
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (70, N'Completers', N'Program1 Subject Area1 ', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (65, N'Completers', N'Program1 Subject Area2', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (71, N'Completers', N'Program2 Area', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'''Elementary''
,''Special Education''
,''Secondary''
,''Early Childhood''
,''Health''
,''PE''
,''Art''', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (72, N'Completers', N'Program2 Subject Area (Secondary)', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (39, N'Completers', N'SSN_Last_5', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 1, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (47, N'Completers', N'Student_Teaching_District_1', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'List of all NM districts', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (53, N'Completers', N'Student_Teaching_District_2', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'List of all NM districts', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (59, N'Completers', N'Student_Teaching_District_3', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'List of all NM districts', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (48, N'Completers', N'Student_Teaching_School_1', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'List of all NM schools', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (54, N'Completers', N'Student_Teaching_School_2', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'List of all NM schools', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (60, N'Completers', N'Student_Teaching_School_3', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', N'List of all NM schools', NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (73, N'Completers', N'TESOL/Bilingual Minor1', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
INSERT [validation].[TemplateField] ([TemplateFieldId], [Template], [Field], [PrimaryKeyField], [ReportField], [PrimaryKeyFilter], [isRequired], [ExpectedType], [ExpectedValues], [minLength], [ExpectedLength], [ExpectedFormat]) VALUES (74, N'Completers', N'TESOL/Bilingual Minor2', N'[SSN_Last_5],[Completer_Birth_Date]', N'[Completer_Last_Name],[Completer_First_name],[Completer_Middle_Initial]', N'A.[SSN_Last_5] = B.[SSN_Last_5] AND A.[Completer_Birth_Date] = B.[Completer_Birth_Date]', 0, N'String', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [validation].[TemplateField] OFF
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (2, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (2, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (2, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (2, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (3, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (3, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (4, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (4, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (5, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (5, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (6, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (6, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (7, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (7, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (7, 4, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (7, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (8, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (8, 4, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (8, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (8, 6, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (9, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (9, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (9, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (10, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (10, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (10, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (11, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (11, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (11, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (12, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (12, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (12, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (13, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (13, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (13, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (14, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (14, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (14, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (21, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (21, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (21, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (22, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (22, 5, N'OMIT')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (23, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (23, 5, N'OMIT ')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (24, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (24, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (24, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (25, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (25, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (26, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (26, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (26, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (26, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (27, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (27, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (27, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (27, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (28, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (28, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (28, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (28, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (29, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (29, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (29, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (29, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (30, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (31, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (32, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (33, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (34, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (34, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (34, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (34, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (35, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (35, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (36, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (36, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (37, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (37, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (38, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (39, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (39, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (39, 4, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (39, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (40, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (40, 4, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (40, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (40, 6, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (41, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (41, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (41, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (42, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (42, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (42, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (43, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (43, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (43, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (44, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (44, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (45, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (45, 3, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (46, 2, N'x')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (46, 3, N'x')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (46, 5, N'x')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (47, 2, N'x')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (47, 3, N'?')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (48, 2, N'x')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (48, 3, N'?')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (49, 2, N'x')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (49, 3, N'x')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (49, 5, N'x')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (50, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (51, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (52, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (52, 3, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (53, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (53, 3, N'?')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (54, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (54, 3, N'?')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (55, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (56, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (57, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (58, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (58, 3, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (59, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (59, 3, N'?')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (60, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (60, 3, N'?')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (61, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (62, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (63, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (64, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (64, 3, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (65, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (66, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (66, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (66, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (66, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (67, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (67, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (67, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (67, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (68, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (68, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (68, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (69, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (69, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (69, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (70, 2, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (70, 3, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (70, 5, N'Warning')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (71, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (71, 3, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (72, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (73, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (74, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (75, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (76, 2, N'x, if not null')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (77, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (77, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (77, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (77, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (78, 1, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (78, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (78, 3, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (78, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (79, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (79, 5, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (81, 2, N'Error')
GO
INSERT [validation].[TemplateFieldRule] ([TemplateFieldId], [RuleId], [ValidationType]) VALUES (81, 5, N'Error')
GO
