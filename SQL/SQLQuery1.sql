-- Create a new database for the book club
CREATE DATABASE BookClub;
GO

-- Use the newly created database
USE BookClub;
GO

-- Create a table to store user information
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL
);
GO

-- Create a table to store book information
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Author NVARCHAR(100) NOT NULL
);
GO

-- Create a table to store user-book relationships (reading, read, suggested)
CREATE TABLE UserBooks (
    UserBookID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    BookID INT NOT NULL,
    Status NVARCHAR(50) NOT NULL, -- 'Reading', 'Read', 'Suggested'
    CurrentChapter INT, -- Chapter number for users who are reading
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
GO

-- Create a table to store book reviews
CREATE TABLE BookReviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT NOT NULL,
    UserID INT NOT NULL,
    ReviewText NVARCHAR(MAX) NOT NULL,
    Rating INT NOT NULL, -- Rating from 1 to 5
    CONSTRAINT FK_BookReviews_BookID FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT FK_BookReviews_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO

-- Insert sample user data (hashed passwords are for demonstration only)
INSERT INTO Users (Username, Email, PasswordHash) VALUES
    ('user1', 'user1@example.com', 'hashed_password_1'),
    ('user2', 'user2@example.com', 'hashed_password_2'),
    ('user3', 'user3@example.com', 'hashed_password_3');
GO

-- Insert sample book data
INSERT INTO Books (Title, Author) VALUES
    ('Book A', 'Author X'),
    ('Book B', 'Author Y'),
    ('Book C', 'Author Z');
GO

-- Insert user-book relationships (sample data)
-- User1 is currently reading Book A, User2 has read Book B, User3 suggested Book C
INSERT INTO UserBooks (UserID, BookID, Status, CurrentChapter) VALUES
    (1, 1, 'Reading', 5),
    (2, 2, 'Read', NULL),
    (3, 3, 'Suggested', NULL);
GO

-- Insert sample book reviews
INSERT INTO BookReviews (BookID, UserID, ReviewText, Rating) VALUES
    (1, 1, 'Great book! Loved the plot.', 5),
    (1, 2, 'Not my favorite, but still a good read.', 3),
    (2, 2, 'Amazing story, couldn''t put it down!', 5);
GO
