USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[BlogCategories_SelectAll]    Script Date: 3/2/2023 2:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Avila, Hector
-- Create date: 02/25/2023

-- Description: Selects all blog category records from dbo.BlogCategories

-- Code Reviewer: Kimberly

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[BlogCategories_SelectAll]


/* ----------Test Code----------

	Execute dbo.BlogCategories_SelectAll
*/

AS
BEGIN
	Select [Id]
		  ,[Name]

	From dbo.BlogCategories
END
GO
