USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Select_ByCreatedBy]    Script Date: 3/3/2023 5:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Avila, Hector
-- Create date: 02/27/2023

-- Description: Selects all the records that a User has created.
--				The param @AuthorId is to select the records from that user.

-- Code Reviewer: Kimberly Elliot

-- MODIFIED BY: AUthor
-- MODIFIED DATE: 03/02/2023
-- Code Reviewer:
-- Note:
-- =============================================


CREATE proc [dbo].[Blogs_Select_ByCreatedBy]
		@PageIndex int
		,@PageSize int
		,@AuthorId int
		
/* ---------- TEST CODE ----------
Declare @PageIndex int = 0
		,@PageSize int = 6
		,@AuthorId int = 8

Execute dbo.Blogs_Select_ByCreatedBy
		@PageIndex
		,@PageSize
		,@AuthorId

Select*
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
	WHERE AuthorId = @AuthorId AND isDeleted = 0
	ORDER BY Id

	OFFSET @offset Rows
	Fetch Next @PageSize Rows ONLY
END
GO
