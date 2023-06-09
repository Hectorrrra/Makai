USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Select_BlogCategory]    Script Date: 3/13/2023 2:17:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Avila, Hector
-- Create date: 02/27/2023

-- Description: Selects all the records that have that specified @BlogCategoryId Param
--				returns all records in a paginated way.

-- Code Reviewer: Kimberly Elliott

-- MODIFIED BY: AUthor
-- MODIFIED DATE: 03/13/2023
-- Code Reviewer:
-- Note:
-- =============================================


CREATE proc [dbo].[Blogs_Select_BlogCategory]
		@BlogCategoryId int
		,@PageIndex int
		,@PageSize int
/* ---------- TEST CODE ----------

Declare @BlogCategoryId int = 1
		,@PageIndex int = 0
		,@PageSize int = 50

Execute dbo.Blogs_Select_BlogCategory
		@BlogCategoryId
		,@PageIndex
		,@PageSize

select*
from dbo.blogs

*/

AS
BEGIN
	Declare @offset int = @PageIndex * @PageSize
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
		,TotalCount = COUNT(1) OVER()

	FROM dbo.Blogs as b
	INNER JOIN dbo.BlogCategories as bc
		ON b.BlogCategoryId = bc.Id
	INNER JOIN dbo.Users as u
		ON b.AuthorId = u.Id 
	WHERE b.BlogCategoryId = @BlogCategoryId AND isDeleted = 0
	ORDER BY Id

	OFFSET @offset Rows
	Fetch Next @PageSize Rows ONLY
END
GO
