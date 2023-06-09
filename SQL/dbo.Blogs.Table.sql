USE [Makai]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 3/2/2023 2:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogCategoryId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](4000) NULL,
	[IsPublished] [bit] NOT NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[DatePublish] [datetime2](7) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blogs] ADD  CONSTRAINT [DF_Blogs_IsPublished]  DEFAULT ((0)) FOR [IsPublished]
GO
ALTER TABLE [dbo].[Blogs] ADD  CONSTRAINT [DF_Blogs_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Blogs] ADD  CONSTRAINT [DF_Blogs_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Blogs] ADD  CONSTRAINT [DF_Blogs_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_BlogCategories] FOREIGN KEY([BlogCategoryId])
REFERENCES [dbo].[BlogCategories] ([Id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_BlogCategories]
GO
