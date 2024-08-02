-- BUSINESS REPORTS SCRIPT
-- GROUP 4
-- Luca Novello  ||  Philip Graham  ||  Jaseem Villan Thenkodath

-- View 1: Total Songs by Artist
CREATE VIEW TotalSongsByArtist AS
SELECT a.ArtistName, COUNT(s.SongID) AS TotalSongs
FROM Artists a
JOIN Songs s ON a.ArtistID = s.ArtistID
GROUP BY a.ArtistName;

-- View 2: Songs in Each Playlist
CREATE VIEW SongsInPlaylists AS
SELECT p.PlaylistName, s.SongName
FROM Playlists p
JOIN PlaylistSongs ps ON p.PlaylistID = ps.PlaylistID
JOIN Songs s ON ps.SongID = s.SongID;

-- View 3: Album Details
CREATE VIEW AlbumDetails AS
SELECT a.AlbumName, ar.ArtistName, a.ReleaseDate
FROM Albums a
JOIN Artists ar ON a.ArtistID = ar.ArtistID;

-- View 4: User Playlists
CREATE VIEW UserPlaylists AS
SELECT u.Username, p.PlaylistName
FROM Users u
JOIN Playlists p ON u.UserID = p.UserID;
