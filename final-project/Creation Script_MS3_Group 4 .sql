-- CREATION SCRIPT
-- GROUP 4
-- Luca Novello  ||  Philip Graham  ||  Jaseem Villan Thenkodath

-- Create sequence for generating UIDs
CREATE SEQUENCE UserSeq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Users (
    UserID NUMBER PRIMARY KEY,
    Username VARCHAR2(50) NOT NULL,
    Password VARCHAR2(255) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    ProfilePicture VARCHAR2(255)
);

CREATE SEQUENCE ArtistSeq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Artists (
    ArtistID NUMBER PRIMARY KEY,
    ArtistName VARCHAR2(100) NOT NULL,
    Genre VARCHAR2(50) NOT NULL,
    Country VARCHAR2(50)
);

CREATE SEQUENCE AlbumSeq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Albums (
    AlbumID NUMBER PRIMARY KEY,
    AlbumName VARCHAR2(100) NOT NULL,
    ReleaseDate DATE NOT NULL,
    ArtistID NUMBER,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

CREATE SEQUENCE SongSeq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Songs (
    SongID NUMBER PRIMARY KEY,
    SongName VARCHAR2(100) NOT NULL,
    Duration INTERVAL DAY TO SECOND(0) NOT NULL,
    AlbumID NUMBER,
    ArtistID NUMBER,
    Genre VARCHAR2(50),
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

CREATE SEQUENCE PlaylistSeq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Playlists (
    PlaylistID NUMBER PRIMARY KEY,
    PlaylistName VARCHAR2(100) NOT NULL,
    UserID NUMBER,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE PlaylistSongs (
    PlaylistID NUMBER,
    SongID NUMBER,
    PRIMARY KEY (PlaylistID, SongID),
    FOREIGN KEY (PlaylistID) REFERENCES Playlists(PlaylistID),
    FOREIGN KEY (SongID) REFERENCES Songs(SongID)
);
