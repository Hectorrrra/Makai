USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_SelectById]    Script Date: 3/3/2023 5:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Avila, Hector
-- Create date: 02/27/2023

-- Description: Selects a record by the @Id Param

-- Code Reviewer: Kimberly Elliot

-- MODIFIED BY: AUTHOR
-- MODIFIED DATE: 03/02/2023
-- Code Reviewer:
-- Note:
-- =============================================


CREATE Proc [dbo].[Blogs_SelectById]
		@Id int

/* ---------- TEST CODE ----------

Declare @Id int = 8

Execute dbo.Blogs_SelectById
		@Id

*/

AS
BEGIN
	Select  b.Id
		,b.BlogCategoryId
		,bc.Name as BlogName
		,b.AuthorId
		,u.FirstName as Name
		,u.LastName
		,u.Mi as mi
		,u.AvatarUrl as avatar
		,b.Title
		,b.Subject
		,b.Content
		,b.IsPublished
		,b.ImageUrl
		,b.DateCreated
		,b.DateModified
		,b.DatePublish
		,b.isDeleted


	
	FROM dbo.Blogs as b
	INNER JOIN dbo.BlogCategories as bc
		ON b.BlogCategoryId = bc.Id
	INNER JOIN dbo.Users as u
		ON b.AuthorId = u.Id
	WHERE b.Id = @Id AND isDeleted = 0
END
GO
