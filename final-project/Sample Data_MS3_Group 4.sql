-- SAMPLE DATA SCRIPT
-- GROUP 4
-- Luca Novello  ||  Philip Graham  ||  Jaseem Villan Thenkodath

-- Insert sample data into Users
INSERT INTO Users (UserID, Username, Password, Email, ProfilePicture) VALUES 
(UserSeq.NEXTVAL, 'johndoe', 'password123', 'johndoe@mail.com', 'profile.jpg');

-- Insert sample data into Artists
INSERT INTO Artists (ArtistID, ArtistName, Genre, Country) VALUES 
(ArtistSeq.NEXTVAL, 'The Beatles', 'Rock', 'UK');

INSERT INTO Artists (ArtistID, ArtistName, Genre, Country) VALUES 
(ArtistSeq.NEXTVAL, 'Pink Floyd', 'Rock', 'UK');

-- Insert sample data into Albums
INSERT INTO Albums (AlbumID, AlbumName, ReleaseDate, ArtistID) VALUES 
(AlbumSeq.NEXTVAL, 'Abbey Road', TO_DATE('1969-09-26', 'YYYY-MM-DD'), 1);

INSERT INTO Albums (AlbumID, AlbumName, ReleaseDate, ArtistID) VALUES 
(AlbumSeq.NEXTVAL, 'The Dark Side of the Moon', TO_DATE('1973-03-01', 'YYYY-MM-DD'), 2);

-- Insert sample data into Songs
INSERT INTO Songs (SongID, SongName, Duration, AlbumID, ArtistID, Genre) VALUES 
(SongSeq.NEXTVAL, 'Come Together', INTERVAL '0 00:04:20' DAY TO SECOND, 1, 1, 'Rock');

INSERT INTO Songs (SongID, SongName, Duration, AlbumID, ArtistID, Genre) VALUES 
(SongSeq.NEXTVAL, 'Money', INTERVAL '0 00:06:22' DAY TO SECOND, 2, 2, 'Rock');

-- Insert sample data into Playlists
INSERT INTO Playlists (PlaylistID, PlaylistName, UserID) VALUES 
(PlaylistSeq.NEXTVAL, 'My Favorites', 1);

-- Insert sample data into PlaylistSongs
INSERT INTO PlaylistSongs (PlaylistID, SongID) VALUES 
(1, 1);

INSERT INTO PlaylistSongs (PlaylistID, SongID) VALUES 
(1, 2);
