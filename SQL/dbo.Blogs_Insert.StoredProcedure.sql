USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Insert]    Script Date: 3/2/2023 2:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Avila, Hector
-- Create date: 02/26/2023

-- Description: Inserts into dbo.Blogs
--				Outputs the Id of the record created.
--				@BlogCategoryId and @AuthorId params should be Ids from dbo.BlogCategories and dbo.Users tables.

-- Code Reviewer: Kimberly

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================


CREATE proc [dbo].[Blogs_Insert]
			@Id int OUTPUT
			,@BlogCategoryId int
			,@AuthorId int
			,@Title nvarchar(100)
			,@Subject nvarchar(50)
			,@Content nvarchar(4000) = null
			,@IsPublished bit 
			,@DatePublish datetime2(7) = null		
			,@ImageUrl nvarchar(255) = null
			
			

/* ---------- TEST CODE ----------

Declare @Id int = 0
		,@BlogCategoryId int = 1
		,@AutherId int = 13
		,@Title nvarchar(100) = 'Test Title From Proc'
		,@Subject nvarchar(50) = 'Test subject from Proc'
		,@Content nvarchar(4000) = null
		,@IsPublished bit = 0
		,@DatePublish datetime2(7) = null
		,@ImageUrl nvarchar(255) = null
		
Execute dbo.Blogs_Insert
		@Id
		,@BlogCategoryId
		,@AutherId
		,@Title
		,@Subject
		,@Content
		,@IsPublished
		,@DatePublish
		,@ImageUrl

Select *
From dbo.Blogs

*/

AS

BEGIN
	
	INSERT INTO [dbo].[Blogs]
           ([BlogCategoryId]
           ,[AuthorId]
           ,[Title]
           ,[Subject]
           ,[Content]
		   ,[IsPublished]
		   ,[DatePublish]
           ,[ImageUrl])
     VALUES
           (@BlogCategoryId
			,@AuthorId
			,@Title 
			,@Subject
			,@Content
			,@IsPublished
			,@DatePublish
			,@ImageUrl)

SET @Id = SCOPE_IDENTITY()
END

GO
