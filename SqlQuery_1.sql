/*******************************************************************************
   ECommerce Database - Version 1.0
   Script: ECommerceSQL.sql
   Description: Creates and populates the ECommerce database.
********************************************************************************/

/*******************************************************************************
   Drop Constraints
********************************************************************************/

/*******************************************************************************
   Drop Tables
********************************************************************************/

   DROP TABLE [ecd].[games];
   GO

   DROP TABLE [ecd].[users];
   GO

/*******************************************************************************
   Drop Schema
********************************************************************************/

   DROP SCHEMA [ecd];
   GO

/*******************************************************************************
   Create Schema
********************************************************************************/

   CREATE SCHEMA [ecd];
   GO

/*******************************************************************************
   Create Tables
********************************************************************************/

   CREATE TABLE [ecd].[users]
   (
      [UserId] INT IDENTITY(1,1) NOT NULL,
      [UserFirstName] NVARCHAR(255) NOT NULL,
      [UserLastName] NVARCHAR(255) NOT NULL,
      [UserEmail] NVARCHAR(255) UNIQUE NOT NULL,
      [UserPassword] NVARCHAR(255) UNIQUE NOT NULL,
   );
   GO

   CREATE TABLE [ecd].[games]
   (
      [GameId] INT IDENTITY(1,1) NOT NULL,
      [GameName] NVARCHAR(255) NOT NULL,
      [ESRBRating] NVARCHAR(255) NOT NULL,
      [GamePrice] MONEY NOT NULL,
      [PlayerRating] INT,
      [CoverArt] NVARCHAR(255),
      [Category] NVARCHAR(255),
      [Publisher] NVARCHAR(255),
      [ReleaseDate] NVARCHAR(255)
   );
   GO

/*******************************************************************************
   Create Primary Key References
********************************************************************************/

   ALTER TABLE [ecd].[users]
      ADD CONSTRAINT [PK_UserId]
      PRIMARY KEY ([UserId]);
   GO

   ALTER TABLE [ecd].[games]
      ADD CONSTRAINT [PK_GameId]
      PRIMARY KEY ([GameId]);
   GO

/*******************************************************************************
   Seed Database
********************************************************************************/

   INSERT INTO [ecd].[users] ([UserFirstName], [UserLastName], [UserEmail], [UserPassword])
      VALUES
         ('Test', 'Test', 'test@test.com', 'TestGamer'),
         ('Jane', 'Doe', 'Jane@no.com', 'JaneDoe'),
         ('Johnny', 'Doe', 'Johnny@no.com', 'JohnnyDoe'),
         ('Jannie', 'Doe', 'Jannie@no.com', 'JannieDoe');
   GO

   INSERT INTO [ecd].[games] ([GameName], [ESRBRating], [GamePrice], [PlayerRating], [CoverArt], [Category], [Publisher], [ReleaseDate])
      VALUES
         ('Call Of Duty MWII', 'M', 69.99, null, 
         'https://imageio.forbes.com/specials-images/imageserve/628d337e791f9767c05ca2e7/1--2-/960x0.jpg?height=887&width=711&fit=bounds',
         'FPS', 'Activision', 'November 17th, 2022'),
         ('Minecraft', 'E10+', 29.99, null, 
         'https://preview.redd.it/jkbymqw8chh71.png?width=640&crop=smart&auto=webp&s=53d68e78b4d1f24c7064b685513340ca2a3bc2f2',
         'Sandbox', 'Mojang Studios', 'November 11th, 2011'),
         ('Overwatch 2', 'T', 0.00, null, 
         'https://www.mobygames.com/images/covers/l/840873-overwatch-2-playstation-4-front-cover.png',
         'Shooter', 'Blizzard', 'October 4th, 2022');
    GO
