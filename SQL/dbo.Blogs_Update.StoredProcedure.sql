USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Update]    Script Date: 3/2/2023 2:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Avila, Hector
-- Create date: 02/27/2023

-- Description: Updates the Specified record with new values.
--				

-- Code Reviewer: Kimberly Elliot

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================


CREATE PROC [dbo].[Blogs_Update]
		@Id int
		,@BlogCategoryId int
		,@AuthorId int
		,@Title nvarchar(100)
		,@Subject nvarchar(50)
		,@Content nvarchar(4000) = null
		,@IsPublished bit
		,@DatePublish datetime2(7) = null
		,@ImageUrl nvarchar(255) = null
/* ------------ TEST CODE -----------

Declare @Id int = 1
		,@BlogCategoryId int = 2
		,@AuthorId int = 12
		,@Title nvarchar(100) = 'Updated Title'
		,@Subject nvarchar(50) = 'Updated Subject' 
		,@Content nvarchar(4000) = 'Updated Content'
		,@IsPublished bit = 0
		,@DatePublish datetime2(7) = '2023-06-13'
		,@ImageUrl nvarchar(255) = 'https://wallup.net/wp-content/uploads/2019/09/611582-blog-blogger-computer-internet-typography-text-media-blogging-social-748x499.jpg'

Select *
From dbo.Blogs
Where Id = @Id

Execute dbo.Blogs_Update
		@Id
		,@BlogCategoryId
		,@AuthorId
		,@Title
		,@Subject
		,@Content
		,@IsPublished
		,@DatePublish
		,@ImageUrl

Select *
From dbo.Blogs
Where Id = @Id
*/

AS
BEGIN
	Declare @DateModified datetime2(7) = getutcdate();
	UPDATE dbo.Blogs
	Set [BlogCategoryId] = @BlogCategoryId
		,[AuthorId] = @AuthorId
		,[Title] = @Title
		,[Subject] = @Subject
		,[Content] = @Content
		,[IsPublished] = @IsPublished
		,[DatePublish] = @DatePublish
		,[ImageUrl] = @ImageUrl
		,[DateModified] = @DateModified
	WHERE Id = @Id
END
GO
