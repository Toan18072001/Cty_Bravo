CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [varchar](255) NOT NULL,
	[ContactInfo] [varchar](255) NOT NULL,
	[Experience] [int] NULL,
	[BusinessID] [int] NULL,
	[Email] [varchar](255) NULL,
	[Pwd] [varchar](255) NULL,
	[DepartmentId] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- afterTable

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [DepartmentId]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Business] ([BusinessID])
Go
CREATE TABLE [dbo].[Class](
	[ClassID] [int] NOT NULL,
	[ClassName] [varchar](255) NOT NULL,
	[DescriptionClass] [text] NULL,
	[EmployeeID] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])

GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [varchar](6) NOT NULL,
	[DepartmentName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Business](
	[BusinessID] [int] NOT NULL,
	[BusinessName] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Test](
	[TestID] [int] NOT NULL,
	[TestName] [varchar](255) NOT NULL,
	[DescriptionTest] [text] NULL,
	[AssessmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Test]  WITH CHECK ADD FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[AssessmentPeriod] ([AssessmentID])
GO
CREATE TABLE [dbo].[AssessmentPeriod](
	[AssessmentID] [int] NOT NULL,
	[AssessmentName] [varchar](255) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ClassID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AssessmentPeriod]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO

CREATE TABLE [dbo].[AssessmentResult](
	[AssessmentResultID] [int] NOT NULL,
	[Score] [int] NULL,
	[TestID] [int] NULL,
	[InternID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssessmentResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AssessmentResult]  WITH CHECK ADD FOREIGN KEY([InternID])
REFERENCES [dbo].[Intern] ([InternID])
GO

ALTER TABLE [dbo].[AssessmentResult]  WITH CHECK ADD FOREIGN KEY([TestID])
REFERENCES [dbo].[Test] ([TestID])
GO
CREATE TABLE [dbo].[Intern](
	[InternID] [int] NOT NULL,
	[InternName] [varchar](255) NOT NULL,
	[ContactInfo] [varchar](255) NOT NULL,
	[BusinessID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InternID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Intern]  WITH CHECK ADD FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Business] ([BusinessID])
GO

-- Thêm trường IsDeleted cho bảng Employee
ALTER TABLE [dbo].[Employee]
ADD [IsDeleted] bit NOT NULL DEFAULT 0;
Go
-- Thêm trường IsDeleted cho bảng Class
ALTER TABLE [dbo].[Class]
ADD [IsDeleted] bit NOT NULL DEFAULT 0;
Go
-- Thêm trường IsDeleted cho bảng Department
ALTER TABLE [dbo].[Department]
ADD [IsDeleted] bit NOT NULL DEFAULT 0;
Go
-- Thêm trường IsDeleted cho bảng Business
ALTER TABLE [dbo].[Business]
ADD [IsDeleted] bit NOT NULL DEFAULT 0;
Go
-- Thêm trường IsDeleted cho bảng Test
ALTER TABLE [dbo].[Test]
ADD [IsDeleted] bit NOT NULL DEFAULT 0;
Go
-- Thêm trường IsDeleted cho bảng AssessmentPeriod
ALTER TABLE [dbo].[AssessmentPeriod]
ADD [IsDeleted] bit NOT NULL DEFAULT 0;
Go
-- Thêm trường IsDeleted cho bảng AssessmentResult
ALTER TABLE [dbo].[AssessmentResult]
ADD [IsDeleted] bit NOT NULL DEFAULT 0;
Go
-- Thêm trường IsDeleted cho bảng Intern
ALTER TABLE [dbo].[Intern]
ADD [IsDeleted] bit NOT NULL DEFAULT 0;
Go
