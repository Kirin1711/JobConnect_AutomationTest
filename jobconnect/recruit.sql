USE [RecruitmentManagement]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[CV] [nvarchar](max) NULL,
	[CoverLetter] [nvarchar](max) NULL,
	[ApplicationDate] [datetime] NULL,
	[JobID] [int] NULL,
	[UserID] [int] NULL,
	[StatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](11) NULL,
	[EmailCompanies] [nvarchar](255) NULL,
	[Website] [nvarchar](max) NULL,
	[AvartarCompanies] [nvarchar](max) NULL,
	[FieldID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Rating] [int] NULL,
	[FeedbackDate] [datetime] NULL,
	[InterviewID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fields]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interviews]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interviews](
	[InterviewID] [int] IDENTITY(1,1) NOT NULL,
	[InterviewDate] [datetime] NULL,
	[InterviewLocation] [nvarchar](255) NULL,
	[InterviewType] [nvarchar](50) NULL,
	[ApplicationID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InterviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SalaryRange] [nvarchar](100) NULL,
	[PostedDate] [datetime] NULL,
	[ExperienceLevel] [nvarchar](50) NULL,
	[JobTypeID] [int] NULL,
	[CompanyID] [int] NULL,
	[ProfessionID] [int] NULL,
	[LocationID] [int] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTypes]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTypes](
	[JobTypeID] [int] IDENTITY(1,1) NOT NULL,
	[JobTypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professions]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professions](
	[ProfessionID] [int] IDENTITY(1,1) NOT NULL,
	[ProfessionName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/30/2025 4:39:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[RoleID] [int] NULL,
	[DateOfBirth] [date] NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[IsActive] [bit] NULL,
	[AvatarURL] [nvarchar](max) NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (14, NULL, NULL, CAST(N'2024-11-18T01:41:42.283' AS DateTime), 12, 2, 5)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (16, N'/uploads/35bd6ab7-27cb-40db-97b8-0695636e21f4.doc', N'/uploads/d33b8f1d-0ae0-4901-94ae-cb1811a11c91.doc', CAST(N'2024-11-18T02:29:38.357' AS DateTime), 12, 2, 5)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (17, N'/uploads/33ad7de5-9b82-4577-b54a-a83cc6a4c77b.pdf', N'/uploads/5f61738d-7664-42a8-8e54-4a7dfd06457a.pdf', CAST(N'2025-03-02T20:35:53.143' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (18, N'/uploads/e7ba4356-f3e1-45ce-86e9-977ee6b53745.rar', N'/uploads/b0a90e09-efba-4a1b-86ad-5ec4139748da.pdf', CAST(N'2025-03-02T22:02:34.387' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (19, N'/uploads/4a3ffa80-84c2-4dd1-a1b6-86aef3c60edb.cs', N'/uploads/92cf4d41-1de0-4460-aa64-9f235142ac96.pdf', CAST(N'2025-03-02T22:04:06.703' AS DateTime), 14, 2, 4)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (20, N'/uploads/9f5fbab9-09d6-45e2-97f2-89113068563a.pdf', N'/uploads/6cdbd8fc-3280-4bdc-b2d9-18f55e81d5df.pdf', CAST(N'2025-03-25T10:16:20.710' AS DateTime), 14, 2, 4)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (21, N'/uploads/e6d6a326-56f9-489c-a127-4b378c0ca92f.pdf', N'/uploads/88478930-6dc2-474c-acd4-4a80e66b13b9.pdf', CAST(N'2025-03-25T10:53:10.407' AS DateTime), 15, 2, 4)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (22, N'/uploads/e72704d0-3b17-4f47-96cc-696750caaf27.pdf', N'/uploads/615b7b5e-26a1-4473-b546-e6c3a91f2591.pdf', CAST(N'2025-03-26T12:56:30.420' AS DateTime), 15, 2, 4)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (23, N'/uploads/184625e9-657a-4560-b610-b66f0b6b9917.pdf', N'/uploads/63525e2e-936e-4997-ba63-e8c0a5be08de.pdf', CAST(N'2025-03-27T15:45:21.493' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (24, N'/uploads/5139669f-14b4-4450-91e6-a0c5fd264439.pdf', N'/uploads/fa042ad2-e9c4-48fe-974b-10ece39dfc61.pdf', CAST(N'2025-03-27T15:48:20.653' AS DateTime), 24, 2, 4)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (25, N'/uploads/973e67c1-6669-4bf9-9cab-88a0074f8c1b.pdf', N'/uploads/b915f857-34b3-47d9-b50e-62635d634da4.pdf', CAST(N'2025-03-27T17:59:22.973' AS DateTime), 18, 2, 5)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (26, N'/uploads/5c9c707c-c437-429d-8ae5-5953b663c07b.pdf', N'/uploads/6129728e-48f9-4b1c-9ef9-66fba3677a47.pdf', CAST(N'2025-03-27T18:30:23.200' AS DateTime), 17, 2, 4)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (27, N'/uploads/91b72d22-fdde-4c23-abec-737b84901ab0.pdf', N'/uploads/f455a4df-a5e3-41ea-80d4-a29a53da78b2.pdf', CAST(N'2025-03-27T20:09:27.043' AS DateTime), 19, 2, 5)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (28, N'/uploads/10647d4c-0145-4aa4-9843-6b2d8d5b7b7d.pdf', N'/uploads/2d95ee96-f51a-4d15-8f73-a94246a2d2fb.pdf', CAST(N'2025-03-27T22:56:08.017' AS DateTime), 24, 20, 4)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (29, N'/uploads/6af6bae8-2e6b-4c03-b31d-958abdc547c1.pdf', N'/uploads/658e7313-127d-41d9-b2a5-6c3d86d33cdd.pdf', CAST(N'2025-03-27T22:56:40.590' AS DateTime), 24, 21, 5)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (30, N'/uploads/7764897d-c7a9-4131-8bb0-9b9f2f8df385.pdf', N'/uploads/ae460a24-d01f-420e-8292-a1c7b59dadcb.pdf', CAST(N'2025-03-27T22:57:33.030' AS DateTime), 24, 22, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (31, N'/uploads/6adeb12f-cc4b-4e69-bf18-f3ef974ac71c.pdf', N'/uploads/f639c44c-4594-4fc9-ab40-6718b12fc041.pdf', CAST(N'2025-03-27T22:58:04.493' AS DateTime), 24, 23, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (32, N'/uploads/361c03d5-a346-4c8b-a32f-e3ba1d129f82.pdf', N'/uploads/85043884-5d64-499f-bf17-5750a230bc34.pdf', CAST(N'2025-03-27T23:00:00.327' AS DateTime), 24, 24, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (33, N'/uploads/c9753c77-4105-4475-8571-5a65f37a0c03.pdf', NULL, CAST(N'2025-03-30T12:40:28.640' AS DateTime), 19, 24, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (34, N'/uploads/d18e4003-7104-4119-bd21-deba28d43c89.pdf', N'/uploads/2a18de0b-6006-4d91-9d85-752e324e0d19.pdf', CAST(N'2025-05-05T15:55:52.050' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (35, N'/uploads/d6678c04-6835-4840-b4ef-3586bd078019.pdf', N'/uploads/6012c92a-fccf-45df-b61a-c06db014a16c.pdf', CAST(N'2025-05-05T17:19:50.060' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (36, N'/uploads/e045dd44-6531-4f4e-8b66-a7e3e10c9e17.pdf', N'/uploads/cc040b4e-9279-48ea-aece-399077dd6ff9.pdf', CAST(N'2025-05-05T20:33:34.217' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (37, N'/uploads/c9a984e0-9231-4b8a-bcf9-21a414ab2cab.pdf', N'/uploads/a8d6bb90-f5b5-421a-921a-14155dc23c76.pdf', CAST(N'2025-05-05T20:53:13.800' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (38, N'/uploads/a5807876-0762-4297-98bc-39b5c18300bb.pdf', NULL, CAST(N'2025-05-05T20:53:36.480' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (39, N'/uploads/6b85f967-35bf-485b-a865-d56cf1b5be8c.pdf', NULL, CAST(N'2025-05-05T21:06:12.847' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (40, N'/uploads/a10b837b-9a72-4cc8-b548-9b8cfc7572d9.pdf', NULL, CAST(N'2025-05-14T16:17:02.460' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (41, N'/uploads/d7590b36-8e36-467a-9355-a50c4cbf2541.pdf', N'/uploads/6b106557-6934-44e1-9ed6-fa85e333dd40.pdf', CAST(N'2025-05-25T20:58:31.760' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (42, N'/uploads/13c68cd9-aba9-4699-a775-fb5230b24dd8.pdf', N'/uploads/09c8abdd-6608-4192-a824-5cbb7c41e20a.pdf', CAST(N'2025-05-25T22:11:44.190' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (43, N'/uploads/dfcd4d6b-20cd-4f64-b17f-902acb4abb96.pdf', N'/uploads/2489558c-0946-40be-8e5c-b62afcd73f66.pdf', CAST(N'2025-05-25T22:25:12.723' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (44, N'/uploads/592260ed-2cc2-4d23-bb3c-091203cd1715.pdf', N'/uploads/e6ec515d-b92e-4faa-aa8d-a9f104a9fe89.pdf', CAST(N'2025-05-26T14:23:19.820' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (45, N'/uploads/27c02de0-5663-461d-a240-c9880a25e272.pdf', N'/uploads/055ffb98-a5e1-4842-938c-4f8e3e709680.pdf', CAST(N'2025-05-26T15:19:41.200' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (46, N'/uploads/b702370b-a154-48f4-8b3b-60d74621124f.pdf', N'/uploads/0cad60e6-cfce-448a-847a-7eb1211fa702.pdf', CAST(N'2025-05-26T15:23:00.817' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (47, N'/uploads/831c372a-3123-4b22-9684-599038f8d957.pdf', N'/uploads/18f83dea-5a13-4e28-9d74-ce407d43b5f1.pdf', CAST(N'2025-05-27T00:10:25.120' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (48, N'/uploads/94721d1c-ef8d-47af-8539-01d36689e8f3.pdf', N'/uploads/d14541c4-5f18-4b26-88e9-37b66f6ad1a1.pdf', CAST(N'2025-05-27T15:37:35.423' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (49, N'/uploads/96e55963-9417-4769-805b-e79192d20c7c.pdf', NULL, CAST(N'2025-05-27T15:43:02.037' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (50, N'/uploads/efc1fdd2-146e-4950-bea7-f8c2e48c73bd.pdf', N'/uploads/aeee3846-2dc7-4877-a401-1d6fb48ede24.pdf', CAST(N'2025-05-27T15:51:21.973' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (51, N'/uploads/34da2644-53c2-4613-b49b-9f823fb39eb1.pdf', N'/uploads/3a459dde-255f-41ca-8ec7-31eb18a6293d.pdf', CAST(N'2025-05-27T15:58:33.923' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (52, N'/uploads/8ae6b1c8-e9fe-402d-a558-77ab65040fad.pdf', N'/uploads/bb9c3c84-c9e1-4e12-b97c-2e6c0a6afeeb.pdf', CAST(N'2025-05-27T16:09:42.537' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (53, N'/uploads/9f56d2e8-a1d5-4850-ba5c-659ecaab0df1.pdf', NULL, CAST(N'2025-05-27T16:10:59.427' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (54, N'/uploads/03c4b848-6824-4ff2-bc1c-97f4a6d3dbb8.pdf', N'/uploads/117ad220-7112-411d-8931-65e32b9373de.pdf', CAST(N'2025-05-27T20:33:49.360' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (55, N'/uploads/a78cbb3e-bbd3-45a1-b893-496aafecef2e.pdf', NULL, CAST(N'2025-05-27T20:34:56.140' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (56, N'/uploads/f77906bd-992d-4022-8aa4-87ab8cc7ab1d.pdf', N'/uploads/644f8c3b-b46f-4506-9c5c-96028fc850dd.pdf', CAST(N'2025-05-30T15:26:49.027' AS DateTime), 12, 2, 6)
INSERT [dbo].[Applications] ([ApplicationID], [CV], [CoverLetter], [ApplicationDate], [JobID], [UserID], [StatusID]) VALUES (57, N'/uploads/c8f43bff-6aee-4c93-a352-da6647320c2a.pdf', NULL, CAST(N'2025-05-30T15:27:51.807' AS DateTime), 12, 2, 6)
SET IDENTITY_INSERT [dbo].[Applications] OFF
GO
SET IDENTITY_INSERT [dbo].[ApplicationStatus] ON 

INSERT [dbo].[ApplicationStatus] ([StatusID], [StatusName]) VALUES (4, N'Accepted')
INSERT [dbo].[ApplicationStatus] ([StatusID], [StatusName]) VALUES (6, N'Pending')
INSERT [dbo].[ApplicationStatus] ([StatusID], [StatusName]) VALUES (5, N'Rejected')
SET IDENTITY_INSERT [dbo].[ApplicationStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyID], [CompanyName], [Address], [Phone], [EmailCompanies], [Website], [AvartarCompanies], [FieldID]) VALUES (2, N'DXC Technology', N'364 Cộng Hòa, Phường 13, Quận Tân Bình, Thành phố Hồ Chí Minh	', NULL, N'DXC_Vietnam_Recruitment@dxc.com', N'https://dxc.com/vn/en	', N'dc915461-e82c-43e2-a787-39b1a250fb66_DXC.png', 108)
INSERT [dbo].[Companies] ([CompanyID], [CompanyName], [Address], [Phone], [EmailCompanies], [Website], [AvartarCompanies], [FieldID]) VALUES (12, N'Microsoft', N'Albuquerque, New Mexico, Hoa Kỳ', NULL, N'support@microsoft.com', N'mwww.microsoft.com', N'3ce89c52-9c04-48b5-b4d5-332eeb9ad583_ms.png', 108)
INSERT [dbo].[Companies] ([CompanyID], [CompanyName], [Address], [Phone], [EmailCompanies], [Website], [AvartarCompanies], [FieldID]) VALUES (13, N'Công ty cổ phần xe khách Phương Trang - FUTA Bus Lines', N'Số 01 Tô Hiến Thành, Phường 3, Thành phố Đà Lạt, Tỉnh Lâm Đồng, Việt Nam.', NULL, N'hotro@futa.vn', N'https://futabus.vn', N'2f71df1e-99cc-4327-af02-0ccf82a049f2_futa.png', 110)
INSERT [dbo].[Companies] ([CompanyID], [CompanyName], [Address], [Phone], [EmailCompanies], [Website], [AvartarCompanies], [FieldID]) VALUES (16, N'MTP Entertainment', N'60 Nguyễn Đình Chiểu, Đa Kao, Quận 1, Hồ Chí Minh', N'02854102202', N'booking@mtpentertainment.com', N'https://mtpentertainment.com', N'dc3483de-9478-4bfc-a4a9-72734acf243f_channels4_profile.jpg', 103)
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Fields] ON 

INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (92, N'Agency (Marketing/Advertising)')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (93, N'Bán lẻ - Hàng tiêu dùng - FMCG')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (94, N'Bảo hiểm')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (95, N'Bảo trì / Sửa chữa')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (96, N'Bất động sản')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (97, N'Chứng khoán')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (98, N'Cơ khí')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (99, N'Cơ quan nhà nước')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (102, N'Điện tử / Điện lạnh')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (100, N'Du lịch')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (101, N'Dược phẩm / Y tế / Công nghệ sinh học')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (103, N'Giải trí')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (104, N'Giáo dục / Đào tạo')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (105, N'In ấn / Xuất bản')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (106, N'Internet / Online')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (107, N'IT - Phần cứng')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (108, N'IT - Phần mềm')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (109, N'Kế toán / Kiểm toán')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (110, N'Logistics - Vận tải')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (111, N'Luật')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (112, N'Marketing / Truyền thông / Quảng cáo')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (113, N'Môi trường')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (114, N'Năng lượng')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (115, N'Ngân hàng')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (116, N'Nhà hàng / Khách sạn')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (117, N'Nhân sự')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (118, N'Nông Lâm Ngư nghiệp')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (119, N'Sản xuất')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (120, N'Tài chính')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (121, N'Thiết kế / kiến trúc')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (122, N'Thời trang')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (123, N'Thương mại điện tử')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (124, N'Tổ chức phi lợi nhuận')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (125, N'Tự động hóa')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (126, N'Tư vấn')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (127, N'Viễn thông')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (128, N'Xây dựng')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (129, N'Xuất nhập khẩu')
SET IDENTITY_INSERT [dbo].[Fields] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (12, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'2000$', CAST(N'2024-11-16T18:55:24.067' AS DateTime), N'Senior', 1, 2, 26, 2, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (13, N'Lập trình viên Frontend', N'Thông thạo các framework và library', N'1000$-1500$', CAST(N'2024-11-16T18:57:11.700' AS DateTime), N'Senior', 1, 2, 26, 2, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (14, N'Tài xế xe khách', N'Có kinh nghiệm lái xe', N'20000000VNĐ', CAST(N'2024-11-18T13:58:20.237' AS DateTime), N'5 năm', 5, 13, 23, 34, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (15, N'Kế toán trưởng', N'Kế toán tốt nghiệp loại giỏi từ các trường thuộc Đại học Quốc gia TPHCM và Hà Nội', N'30000000VNĐ', CAST(N'2024-11-18T14:14:34.900' AS DateTime), N'Không yêu cầu kinh nghiệm', 1, 13, 28, 2, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (16, N'Tester', N'Biết Test', N'2000$', CAST(N'2024-11-20T08:59:14.457' AS DateTime), N'Senior', 1, 2, 26, 1, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (17, N'Nhân viên bán vé', N'bán vé', N'3.000.000VNĐ', CAST(N'2025-03-16T00:23:28.527' AS DateTime), N'Không yêu cầu kinh nghiệm', 1, 13, 23, 2, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (18, N'Nhân viên bảo vệ', N'bảo vệ ', N'5000000 VNĐ', CAST(N'2025-03-25T22:58:42.650' AS DateTime), N'Không yêu cầu kinh nghiệm', 1, 13, 40, 14, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (19, N'Nhân viên bảo vệ MB', N'BV', N'5000000 VNĐ', CAST(N'2025-03-26T01:18:38.363' AS DateTime), N'Không yêu cầu kinh nghiệm', 5, 13, 40, 1, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (20, N'NV bán hàng', N'NV', N'5000000 VNĐ', CAST(N'2025-03-26T02:00:39.490' AS DateTime), N'Không yêu cầu kinh nghiệm', 5, 13, 31, 1, N'Rejected')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (23, N'Tài xế Container', N'xe (Premium)', N'40000000VNĐ + Premium Salary', CAST(N'2025-03-26T10:22:32.560' AS DateTime), N'Lái xe trên 5 năm', 5, 13, 34, 2, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (24, N'NV IT', N'dsdas', N'5000000 VNĐ', CAST(N'2025-03-27T15:46:28.540' AS DateTime), N'Không yêu cầu kinh nghiệm', 3, 13, 26, 2, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (25, N'NV IT BE', N'asdadas', N'5000000 VNĐ', CAST(N'2025-03-30T12:39:01.483' AS DateTime), N'Senior', 1, 13, 26, 2, N'Rejected')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (26, N'Lập trình viên', N'Biết ít nhất 1 ngôn ngữ lập trình', N'20.000.000', CAST(N'2025-05-06T00:36:29.723' AS DateTime), N'2 năm', 4, 13, 26, 1, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (71, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-24T11:12:02.040' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (72, N'Lập trình viên Backend', NULL, N'15000000', CAST(N'2025-05-24T11:12:17.047' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (73, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', NULL, CAST(N'2025-05-24T11:12:23.703' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Rejected')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (96, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-30T14:49:20.540' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Approved')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (97, N'aa', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-30T14:50:18.123' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Rejected')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (98, N'!@#@#!!@#', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-30T14:50:51.703' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (99, N'213123213213213213123', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-30T14:51:20.057' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (100, N'Lập trình viên Backend', NULL, N'15000000', CAST(N'2025-05-30T14:51:48.197' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (101, N'Lập trình viên Backend', N'@@@@', N'15000000', CAST(N'2025-05-30T14:52:16.833' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (102, N'Lập trình viên Backend', N'123213213123', N'15000000', CAST(N'2025-05-30T14:52:45.273' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (103, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-30T14:53:13.690' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (104, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', NULL, CAST(N'2025-05-30T14:53:42.160' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (105, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'dâsđâsd', CAST(N'2025-05-30T14:54:10.700' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (106, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'213@@@', CAST(N'2025-05-30T14:54:39.177' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (107, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'1', CAST(N'2025-05-30T14:55:08.990' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (108, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'-12000000', CAST(N'2025-05-30T14:55:46.700' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (109, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-30T14:56:15.267' AS DateTime), N'1 năm', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (110, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-30T14:56:43.617' AS DateTime), NULL, 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (111, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-30T14:57:12.397' AS DateTime), N'1 @@', 1, 13, 26, 2, N'Pending')
INSERT [dbo].[Jobs] ([JobID], [Title], [Description], [SalaryRange], [PostedDate], [ExperienceLevel], [JobTypeID], [CompanyID], [ProfessionID], [LocationID], [Status]) VALUES (112, N'Lập trình viên Backend', N'Có kiến thức tốt về Java', N'15000000', CAST(N'2025-05-30T14:57:42.457' AS DateTime), N'-1', 1, 13, 26, 2, N'Pending')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[JobTypes] ON 

INSERT [dbo].[JobTypes] ([JobTypeID], [JobTypeName]) VALUES (5, N'Contract')
INSERT [dbo].[JobTypes] ([JobTypeID], [JobTypeName]) VALUES (4, N'Freelance')
INSERT [dbo].[JobTypes] ([JobTypeID], [JobTypeName]) VALUES (1, N'Full-time')
INSERT [dbo].[JobTypes] ([JobTypeID], [JobTypeName]) VALUES (8, N'Hybrid')
INSERT [dbo].[JobTypes] ([JobTypeID], [JobTypeName]) VALUES (3, N'Internship')
INSERT [dbo].[JobTypes] ([JobTypeID], [JobTypeName]) VALUES (2, N'Part-time')
INSERT [dbo].[JobTypes] ([JobTypeID], [JobTypeName]) VALUES (7, N'Remote')
INSERT [dbo].[JobTypes] ([JobTypeID], [JobTypeName]) VALUES (6, N'Temporary')
SET IDENTITY_INSERT [dbo].[JobTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (1, N'Hà Nội')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (2, N'Hồ Chí Minh')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (3, N'Hải Phòng')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (4, N'Đà Nẵng')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (5, N'Cần Thơ')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (6, N'An Giang')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (7, N'Bà Rịa - Vũng Tàu')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (8, N'Bắc Giang')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (9, N'Bắc Kạn')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (10, N'Bạc Liêu')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (11, N'Bắc Ninh')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (12, N'Bình Dương')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (13, N'Bình Định')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (14, N'Bình Phước')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (15, N'Bình Thuận')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (16, N'Cà Mau')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (17, N'Cao Bằng')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (18, N'Đắk Lắk')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (19, N'Đắk Nông')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (20, N'Điện Biên')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (21, N'Dồng Nai')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (22, N'Dồng Tháp')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (23, N'Gia Lai')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (24, N'Hà Giang')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (25, N'Hà Nam')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (26, N'Hà Tĩnh')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (27, N'Hậu Giang')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (28, N'Hòa Bình')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (29, N'Hưng Yên')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (30, N'Khánh Hòa')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (31, N'Kiên Giang')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (32, N'Kon Tum')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (33, N'Lai Châu')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (34, N'Lâm Đồng')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (35, N'Long An')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (36, N'Lào Cai')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (37, N'Nam Định')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (38, N'Nghệ An')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (39, N'Ninh Bình')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (40, N'Ninh Thuận')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (41, N'Phú Thọ')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (42, N'Phú Yên')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (43, N'Quảng Bình')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (44, N'Quảng Nam')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (45, N'Quảng Ngãi')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (46, N'Quảng Ninh')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (47, N'Quảng Trị')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (48, N'Sóc Trăng')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (49, N'Sơn La')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (50, N'Tây Ninh')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (51, N'Thái Bình')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (52, N'Thái Nguyên')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (53, N'Thanh Hóa')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (54, N'Thừa Thiên Huế')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (55, N'Tiền Giang')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (56, N'Trà Vinh')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (57, N'Tuyên Quang')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (58, N'Vĩnh Long')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (59, N'Vĩnh Phúc')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (60, N'Yên Bái')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (61, N'Lai Châu')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (62, N'Bến Tre')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (63, N'Lạng Sơn')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Professions] ON 

INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (31, N'Bán lẻ/Dịch vụ đời sống')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (27, N'Bất động sản/Xây dựng')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (26, N'Công nghệ Thông tin')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (23, N'Dịch vụ khách hàng/Vận hành')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (33, N'Điện/Điện tử/Viễn thông')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (36, N'Dược/Y tế/Sức khoẻ/Công nghệ sinh học')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (30, N'Giáo dục/Đào tạo')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (28, N'Kế toán/Kiểm toán/Thuế')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (21, N'Kinh doanh/Bán hàng')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (34, N'Logistics/Thu mua/Kho/Tài xế')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (22, N'Marketing/PR/Quảng cáo')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (39, N'Năng lượng/Môi trường/Nông nghiệp')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (38, N'Nhà hàng/Khách sạn/Du lịch')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (24, N'Nhân sự/Hành chính/Pháp chế')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (40, N'Nhóm nghề khác')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (32, N'Phim và truyền hình/Báo chí/Xuất bản')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (29, N'Sản xuất')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (25, N'Tài chính/Ngân hàng/Bảo hiểm')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (37, N'Thiết kế')
INSERT [dbo].[Professions] ([ProfessionID], [ProfessionName]) VALUES (35, N'Tư vấn chuyên môn/Luật/Biên phiên dịch')
SET IDENTITY_INSERT [dbo].[Professions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Applicant')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Recruiter')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (2, N'vinhle123', N'123456789', N'Lê Thành Vinh', N'vinhle@gmail.com', 1, CAST(N'2004-11-17' AS Date), N'0909090908', 1, N'20aff5c4-540f-4ff2-9d08-53b08c0f8171_z4657821443384_34c8e61d4c7748712f392ab176d2b58d.jpg', NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (3, N'tuanha2912', N'12345789', N'Hà Diêm Tuấn', N'hatuan@gmail.com', 1, CAST(N'2004-12-29' AS Date), N'0909090904', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (4, N'thongnguyen', N'123456789', N'Nguyễn Hoàng Thông', N'thong@gmail.com', 2, CAST(N'2004-10-02' AS Date), N'0909090905', 1, NULL, 12)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (5, N'tuongpham', N'123456789', N'Phạm Ngọc Tưởng', N'tuongpham@gmai.com', 1, CAST(N'2004-11-10' AS Date), N'0909090903', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (7, N'jobconnect@hotro.vn', N'admin123', N'jobconnect', N'jobconnect@hotro.vn', 3, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (14, N'thongnguyen123', N'123456789', N'Nguyễn Hoàng Thông', N'thongnguyen@gmail.com', 2, CAST(N'2004-11-18' AS Date), N'0909090901', 1, NULL, 13)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (17, N'toilaai', N'123456789', N'toi la ai', N'toilaai@gmail.com', 1, CAST(N'2000-03-15' AS Date), N'090909012', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (18, N'toimuonlamungvien', N'123456789', N'toimuonlamungvien', N'ungvien@gmail.com', 1, CAST(N'2001-12-04' AS Date), N'098564781', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (19, N'toichinhlantd', N'123456789', N'toichinhlantd', N'td@gmail.com', 2, CAST(N'2000-03-08' AS Date), N'0975892851', 1, NULL, 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (20, N'user1', N'123456789', N'user1', N'user1@gmail.com', 1, CAST(N'2025-03-27' AS Date), N'092478194563', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (21, N'user2', N'123456789', N'user2', N'user2@gmail.com', 1, CAST(N'2025-03-27' AS Date), N'0942875938', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (22, N'user3', N'123456789', N'user3', N'user3@gmail.com', 1, CAST(N'2025-03-27' AS Date), N'0903456345', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (23, N'user4', N'123456789', N'user4', N'user4@gmail.com', 1, CAST(N'2025-03-27' AS Date), N'0978976512', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (24, N'user5', N'123456789', N'user5', N'user5@gmail.com', 1, CAST(N'2025-03-27' AS Date), N'090245681342', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (25, N'user6', N'123456789', N'user6', N'user6@gmail.com', 1, CAST(N'2025-03-28' AS Date), N'0934785674', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (104, N'test1', N'test1', N'test1', N'test1@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567812', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (105, N'taikhoan', N'test', N'test2', N'test2@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567834', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (106, N'thu', N'test3', N'test3', N'test3@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567856', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (107, N'test12121212121212', N'test4', N'test4', N'test4@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567878', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (108, N'test5!', N'test5', N'test5', N'test5@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567123', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (109, N'Test52', N'test52', N'test52', N'test52@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567432', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (110, N'test6', N'test6', N'test6', N'test6@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567124', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (111, N'test 8', N'test8', N'test8', N'test8@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567126', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (113, N'test13', N'test13', N'test13', N'test@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567131', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (114, N'test14', N'Test14', N'Test14', N'test14@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567132', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (115, N'test15', N'Test15!', N'test15', N'test15@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567133', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (116, N'test16', N'test16', N'test16', N'test16@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567134', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (117, N'test17', N'test', N'test17', N'test17@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567135', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (118, N'test18', N'test18', N'test18', N'test18@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567136', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (119, N'test19', N'test19', N'test19', N'test19@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567137', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (120, N'test20', N'test', N'test20', N'test20@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567138', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (121, N'test22', N'test22', N'test22', N'test22@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567140', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (122, N'test23', N'test23', N'test23', N'test23@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'12345671401', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (123, N'test24', N'test24', N'test24', N'test24@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (124, N'test25', N'test25', N'test25', N'test25@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567142', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (125, N'test26', N'test26', N'test26', N'test26@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'123456714s', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (126, N'test27', N'test27', N'test27', N'test27@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'123456714!', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (127, N'test28', N'test28', N'test28', N'test28@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567812', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (128, N'test29', N'test29', N'test29', N'test29@gmail.com', 1, CAST(N'2004-05-23' AS Date), NULL, 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (129, N'test30', N'test30', N'test30!!', N'test30@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567143', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (130, N'test31', N'test31', NULL, N'test31@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567144', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (131, N'test32', N'test32', N'test32', N'test32@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567145', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (132, N'test33', N'test33', N'test33', N'test33@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567146', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (133, N'test34', N'test34', N'test34', N'test34@gmail.com', 1, NULL, N'1234567147', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (134, N'test35', N'test35', N'test35', N'test35@gmail.com', 1, CAST(N'2023-05-23' AS Date), N'1234567148', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (135, N'test36', N'test36', N'test36', N'test36@gmail.com', 1, CAST(N'2029-05-23' AS Date), N'1234567149', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Email], [RoleID], [DateOfBirth], [PhoneNumber], [IsActive], [AvatarURL], [CompanyID]) VALUES (136, N'test37', N'test37', N'test 37', N'test37@gmail.com', 1, CAST(N'2004-05-23' AS Date), N'1234567145', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Applicat__05E7698A227D0D7F]    Script Date: 5/30/2025 4:39:12 PM ******/
ALTER TABLE [dbo].[ApplicationStatus] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Companie__B805C4A49331EDEE]    Script Date: 5/30/2025 4:39:12 PM ******/
ALTER TABLE [dbo].[Companies] ADD UNIQUE NONCLUSTERED 
(
	[EmailCompanies] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Fields__A88707A67B87F19A]    Script Date: 5/30/2025 4:39:12 PM ******/
ALTER TABLE [dbo].[Fields] ADD UNIQUE NONCLUSTERED 
(
	[FieldName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__JobTypes__2C951EA8F78FD137]    Script Date: 5/30/2025 4:39:12 PM ******/
ALTER TABLE [dbo].[JobTypes] ADD UNIQUE NONCLUSTERED 
(
	[JobTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Professi__704E62FB9BBFA128]    Script Date: 5/30/2025 4:39:12 PM ******/
ALTER TABLE [dbo].[Professions] ADD UNIQUE NONCLUSTERED 
(
	[ProfessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__8A2B61609449FD77]    Script Date: 5/30/2025 4:39:12 PM ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4615D8EE7]    Script Date: 5/30/2025 4:39:12 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534E7FD123C]    Script Date: 5/30/2025 4:39:12 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Jobs] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[ApplicationStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([FieldID])
REFERENCES [dbo].[Fields] ([FieldID])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([InterviewID])
REFERENCES [dbo].[Interviews] ([InterviewID])
GO
ALTER TABLE [dbo].[Interviews]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD FOREIGN KEY([JobTypeID])
REFERENCES [dbo].[JobTypes] ([JobTypeID])
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD FOREIGN KEY([ProfessionID])
REFERENCES [dbo].[Professions] ([ProfessionID])
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Locations]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_OnlyRecruiterCanHaveCompany] CHECK  (([RoleID]=(2) OR [CompanyID] IS NULL))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_OnlyRecruiterCanHaveCompany]
GO
