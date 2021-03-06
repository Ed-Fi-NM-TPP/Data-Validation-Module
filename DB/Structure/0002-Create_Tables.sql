/****** Object:  Table [staging].[Admissions]    Script Date: 10/19/2017 5:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Admissions](
	[Institution ID] [nvarchar](255) NULL,
	[InstitutionName] [nvarchar](255) NULL,
	[Candidate Last Name] [nvarchar](255) NULL,
	[Candidate First Name] [nvarchar](255) NULL,
	[Candidate Middle Initial] [nvarchar](255) NULL,
	[Candidate SSN] [nvarchar](255) NULL,
	[Candidate Birth Date] [nvarchar](255) NULL,
	[Candidate Ethnicity] [nvarchar](255) NULL,
	[Candidate Gender] [nvarchar](255) NULL,
	[Candidate Admission Status] [nvarchar](255) NULL,
	[Candidate Admitting GPA] [nvarchar](255) NULL,
	[Candidate ACT] [nvarchar](255) NULL,
	[Candidate SAT] [nvarchar](255) NULL,
	[Has Taken Essential Skills Subtest I] [nvarchar](255) NULL,
	[Has Passed Essential Skills Subtest I] [nvarchar](255) NULL,
	[Score Subtest I] [nvarchar](255) NULL,
	[Has Taken Essential Skills Subtest II] [nvarchar](255) NULL,
	[Has Passed Essential Skills Subtest II] [nvarchar](255) NULL,
	[Score Subtest II] [nvarchar](255) NULL,
	[Has Taken Essential Skills Subtest III] [nvarchar](255) NULL,
	[Has Passed Essential Skills Subtest III] [nvarchar](255) NULL,
	[Score Subtest III] [nvarchar](255) NULL,
	[Program Type] [nvarchar](255) NULL,
	[Program Area1] [nvarchar](255) NULL,
	[Program1 Subject Area1 ] [nvarchar](255) NULL,
	[Program1 Subject Area2] [nvarchar](255) NULL,
	[Program2 Area] [nvarchar](255) NULL,
	[Program2 Subject Area (Secondary)] [nvarchar](255) NULL,
	[TESOL/Bilingual Minor1] [nvarchar](255) NULL,
	[TESOL/Bilingual Minor2] [nvarchar](255) NULL,
	[Other Minor1] [nvarchar](255) NULL,
	[Other Minor2] [nvarchar](255) NULL,
	[Program1 Start Month] [nvarchar](255) NULL,
	[Program1 Start Year] [nvarchar](255) NULL,
	[Expected Program1 End Month] [nvarchar](255) NULL,
	[Expected Program1 End Year] [nvarchar](255) NULL,
	[File Name] [nvarchar](255) NOT NULL,
	[Tab Name] [nvarchar](255) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [staging].[Completers]    Script Date: 10/19/2017 5:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Completers](
	[Institution_ID] [nvarchar](255) NULL,
	[Institution_Name] [nvarchar](255) NULL,
	[Completer_Last_Name] [nvarchar](255) NULL,
	[Completer_First_name] [nvarchar](255) NULL,
	[Completer_Middle_Initial] [nvarchar](255) NULL,
	[SSN_Last_5] [nvarchar](255) NULL,
	[Completer_Birth_Date] [nvarchar](255) NULL,
	[Completer_Ethnicity] [nvarchar](255) NULL,
	[Completer_Gender] [nvarchar](255) NULL,
	[Graduating_GPA] [nvarchar](255) NULL,
	[Program_gpa] [nvarchar](255) NULL,
	[Content_GPA] [nvarchar](255) NULL,
	[Student_Teaching_District_1] [nvarchar](255) NULL,
	[Student_Teaching_School_1] [nvarchar](255) NULL,
	[Hours_Student_Teaching_School_1] [nvarchar](255) NULL,
	[Alternative_Internship_Year_School_1] [nvarchar](255) NULL,
	[CT_First_Name_1] [nvarchar](255) NULL,
	[CT_MI_1] [nvarchar](255) NULL,
	[CT_Last_Name_1] [nvarchar](255) NULL,
	[Student_Teaching_District_2] [nvarchar](255) NULL,
	[Student_Teaching_School_2] [nvarchar](255) NULL,
	[Hours_Student_Teaching_School_2] [nvarchar](255) NULL,
	[Alternative_Internship_Year_School_2] [nvarchar](255) NULL,
	[CT_First_Name_2] [nvarchar](255) NULL,
	[CT_MI_2] [nvarchar](255) NULL,
	[CT_Last_Name_2] [nvarchar](255) NULL,
	[Student_Teaching_District_3] [nvarchar](255) NULL,
	[Student_Teaching_School_3] [nvarchar](255) NULL,
	[Hours_Student_Teaching_School_3] [nvarchar](255) NULL,
	[Alternative_Internship_Year_School_3] [nvarchar](255) NULL,
	[CT_First_Name_3] [nvarchar](255) NULL,
	[CT_MI_3] [nvarchar](255) NULL,
	[CT_Last_Name_3] [nvarchar](255) NULL,
	[Program Type] [nvarchar](255) NULL,
	[Program Area1] [nvarchar](255) NULL,
	[Program1 Subject Area1] [nvarchar](255) NULL,
	[Program1 Subject Area2] [nvarchar](255) NULL,
	[Program2 Area] [nvarchar](255) NULL,
	[Program2 Subject Area (Secondary)] [nvarchar](255) NULL,
	[TESOL/Bilingual Minor1] [nvarchar](255) NULL,
	[TESOL/Bilingual Minor2] [nvarchar](255) NULL,
	[Other Minor1] [nvarchar](255) NULL,
	[Other Minor2] [nvarchar](255) NULL,
	[Program1 Start Month] [nvarchar](255) NULL,
	[Program1 Start Year] [nvarchar](255) NULL,
	[Expected Program1 End Month] [nvarchar](255) NULL,
	[Expected Program1 End Year] [nvarchar](255) NULL,
	[Licensure_completion] [nvarchar](255) NULL,
	[Graduated] [nvarchar](255) NULL,
	[File Name] [nvarchar](255) NULL,
	[Tab Name] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [validation].[Queries]    Script Date: 10/19/2017 5:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [validation].[Queries](
	[Queryid] [int] IDENTITY(1,1) NOT NULL,
	[Query] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [validation].[Rule]    Script Date: 10/19/2017 5:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [validation].[Rule](
	[RuleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Expression] [nvarchar](1500) NOT NULL,
	[OutputMessage] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Rule] PRIMARY KEY CLUSTERED 
(
	[RuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [validation].[TemplateField]    Script Date: 10/19/2017 5:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [validation].[TemplateField](
	[TemplateFieldId] [int] IDENTITY(1,1) NOT NULL,
	[Template] [nvarchar](255) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[PrimaryKeyField] [nvarchar](255) NOT NULL,
	[ReportField] [nvarchar](255) NULL,
	[PrimaryKeyFilter] [nvarchar](255) NULL,
	[isRequired] [bit] NULL,
	[ExpectedType] [nvarchar](50) NULL,
	[ExpectedValues] [nvarchar](1000) NULL,
	[minLength] [int] NULL,
	[ExpectedLength] [int] NULL,
	[ExpectedFormat] [nvarchar](50) NULL,
 CONSTRAINT [PK_TemplateField] PRIMARY KEY CLUSTERED 
(
	[Template] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [validation].[TemplateFieldRule]    Script Date: 10/19/2017 5:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [validation].[TemplateFieldRule](
	[TemplateFieldId] [int] NOT NULL,
	[RuleId] [int] NOT NULL,
	[ValidationType] [nvarchar](100) NULL,
 CONSTRAINT [PK_TemplateFieldRule] PRIMARY KEY CLUSTERED 
(
	[TemplateFieldId] ASC,
	[RuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [validation].[ValidationOutput]    Script Date: 10/19/2017 5:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [validation].[ValidationOutput](
	[ValidationOutputId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[TabName] [nvarchar](100) NOT NULL,
	[TeacherLastName] [nvarchar](100) NULL,
	[TeacherFirstName] [nvarchar](100) NULL,
	[TeacherMiddleName] [nvarchar](100) NULL,
	[Field] [nvarchar](100) NOT NULL,
	[ErrorMessage] [nvarchar](100) NULL,
	[ValidationType] [nvarchar](100) NULL,
	[ErrorRows] [int] NULL,
	[WarningRows] [int] NULL
) ON [PRIMARY]

GO
