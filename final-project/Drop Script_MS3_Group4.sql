-- Drop tables
DROP TABLE PlaylistSongs CASCADE CONSTRAINTS;
DROP TABLE Playlists CASCADE CONSTRAINTS;
DROP TABLE Songs CASCADE CONSTRAINTS;
DROP TABLE Albums CASCADE CONSTRAINTS;
DROP TABLE Artists CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;

-- Drop sequences
DROP SEQUENCE UserSeq;
DROP SEQUENCE ArtistSeq;
DROP SEQUENCE AlbumSeq;
DROP SEQUENCE SongSeq;
DROP SEQUENCE PlaylistSeq;