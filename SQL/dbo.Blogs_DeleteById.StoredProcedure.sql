USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_DeleteById]    Script Date: 3/2/2023 2:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author: Avila, Hector
-- Create date: 02/27/2023

-- Description: Updates the isDeleted Column to a 1 to show that the record is deleted.

-- Code Reviewer: Kimberly

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================


CREATE PROC [dbo].[Blogs_DeleteById]
		@Id int

/* ----------- TEST CODE -----------

Declare @Id int = 1

Execute dbo.Blogs_DeleteById
		@Id

Select *
From dbo.blogs
Where Id = @Id

*/

AS
BEGIN
	UPDATE dbo.Blogs
	SET isDeleted = 1
	WHERE Id = @id
END
GO
