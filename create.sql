-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-12-13 08:40:47.893

-- tables
-- Table: Account
CREATE TABLE Account (
    account_id int  NOT NULL,
    account_type text  NOT NULL,
    CONSTRAINT Account_pk PRIMARY KEY (account_id)
);

-- Table: Album
CREATE TABLE Album (
    album_id int  NOT NULL,
    name text  NOT NULL,
    release_date date  NOT NULL,
    CONSTRAINT Album_pk PRIMARY KEY (album_id)
);

-- Table: Artist
CREATE TABLE Artist (
    artist_id int  NOT NULL,
    CONSTRAINT Artist_pk PRIMARY KEY (artist_id)
);

-- Table: Comments
CREATE TABLE Comments (
    comment_id int  NOT NULL,
    email text  NOT NULL,
    podcast_id int  NOT NULL,
    comment text  NOT NULL,
    rating int  NOT NULL,
    CONSTRAINT Comments_pk PRIMARY KEY (comment_id)
);

-- Table: Contains
CREATE TABLE Contains (
    podcast_id int  NOT NULL,
    playlist_id int  NOT NULL,
    CONSTRAINT Contains_pk PRIMARY KEY (podcast_id,playlist_id)
);

-- Table: Creates
CREATE TABLE Creates (
    artist_id int  NOT NULL,
    album_id int  NOT NULL,
    CONSTRAINT Creates_pk PRIMARY KEY (artist_id,album_id)
);

-- Table: Creator
CREATE TABLE Creator (
    creator_id int  NOT NULL,
    name text  NOT NULL,
    monthly_listeners int  NOT NULL,
    CONSTRAINT Creator_pk PRIMARY KEY (creator_id)
);

-- Table: Friends
CREATE TABLE Friends (
    email1 text  NOT NULL,
    email2 text  NOT NULL,
    CONSTRAINT Friends_pk PRIMARY KEY (email1,email2)
);

-- Table: Incorporates
CREATE TABLE Incorporates (
    song_id int  NOT NULL,
    playlist_id int  NOT NULL,
    CONSTRAINT Incorporates_pk PRIMARY KEY (song_id,playlist_id)
);

-- Table: Listens
CREATE TABLE Listens (
    listen_id int  NOT NULL,
    email text  NOT NULL,
    podcast_id int  NOT NULL,
    listen_time int  NOT NULL,
    CONSTRAINT Listens_pk PRIMARY KEY (listen_id)
);

-- Table: Makes
CREATE TABLE Makes (
    podcast_id int  NOT NULL,
    podcast_creator_id int  NOT NULL,
    CONSTRAINT Makes_pk PRIMARY KEY (podcast_id,podcast_creator_id)
);

-- Table: Playlist
CREATE TABLE Playlist (
    playlist_id int  NOT NULL,
    name text  NOT NULL,
    description text  NOT NULL,
    email text  NOT NULL,
    CONSTRAINT Playlist_pk PRIMARY KEY (playlist_id)
);

-- Table: Podcast
CREATE TABLE Podcast (
    podcast_id int  NOT NULL,
    title text  NOT NULL,
    topic text  NOT NULL,
    duration int  NOT NULL,
    CONSTRAINT Podcast_pk PRIMARY KEY (podcast_id)
);

-- Table: Podcast_Creator
CREATE TABLE Podcast_Creator (
    podcast_creator_id int  NOT NULL,
    CONSTRAINT Podcast_Creator_pk PRIMARY KEY (podcast_creator_id)
);

-- Table: Reviews
CREATE TABLE Reviews (
    email text  NOT NULL,
    song_id int  NOT NULL,
    review text  NOT NULL,
    rating int  NOT NULL,
    CONSTRAINT Reviews_pk PRIMARY KEY (email,song_id)
);

-- Table: Song
CREATE TABLE Song (
    song_id int  NOT NULL,
    title text  NOT NULL,
    genre text  NOT NULL,
    duration int  NOT NULL,
    album_id int  NOT NULL,
    CONSTRAINT Song_pk PRIMARY KEY (song_id)
);

-- Table: Streams
CREATE TABLE Streams (
    stream_id int  NOT NULL,
    email text  NOT NULL,
    song_id int  NOT NULL,
    stream_time int  NOT NULL,
    CONSTRAINT Streams_pk PRIMARY KEY (stream_id)
);

-- Table: Subscriber
CREATE TABLE Subscriber (
    email text  NOT NULL,
    name text  NOT NULL,
    gender text  NOT NULL,
    region text  NOT NULL,
    account_id int  NOT NULL,
    CONSTRAINT email PRIMARY KEY (email)
);

-- foreign keys
-- Reference: Artist_Creator (table: Artist)
ALTER TABLE Artist ADD CONSTRAINT Artist_Creator
    FOREIGN KEY (artist_id)
    REFERENCES Creator (creator_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Contains_Playlist (table: Contains)
ALTER TABLE Contains ADD CONSTRAINT Contains_Playlist
    FOREIGN KEY (playlist_id)
    REFERENCES Playlist (playlist_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Contains_Podcast (table: Contains)
ALTER TABLE Contains ADD CONSTRAINT Contains_Podcast
    FOREIGN KEY (podcast_id)
    REFERENCES Podcast (podcast_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Creates_Album (table: Creates)
ALTER TABLE Creates ADD CONSTRAINT Creates_Album
    FOREIGN KEY (album_id)
    REFERENCES Album (album_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Creates_Artist (table: Creates)
ALTER TABLE Creates ADD CONSTRAINT Creates_Artist
    FOREIGN KEY (artist_id)
    REFERENCES Artist (artist_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Friends1_Subscriber (table: Friends)
ALTER TABLE Friends ADD CONSTRAINT Friends1_Subscriber
    FOREIGN KEY (email2)
    REFERENCES Subscriber (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Friends2_Subscriber (table: Friends)
ALTER TABLE Friends ADD CONSTRAINT Friends2_Subscriber
    FOREIGN KEY (email1)
    REFERENCES Subscriber (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Incorporates_Playlist (table: Incorporates)
ALTER TABLE Incorporates ADD CONSTRAINT Incorporates_Playlist
    FOREIGN KEY (playlist_id)
    REFERENCES Playlist (playlist_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Incorporates_Song (table: Incorporates)
ALTER TABLE Incorporates ADD CONSTRAINT Incorporates_Song
    FOREIGN KEY (song_id)
    REFERENCES Song (song_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Listens_Podcast (table: Listens)
ALTER TABLE Listens ADD CONSTRAINT Listens_Podcast
    FOREIGN KEY (podcast_id)
    REFERENCES Podcast (podcast_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Listens_Subscriber (table: Listens)
ALTER TABLE Listens ADD CONSTRAINT Listens_Subscriber
    FOREIGN KEY (email)
    REFERENCES Subscriber (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Makes_Podcast (table: Makes)
ALTER TABLE Makes ADD CONSTRAINT Makes_Podcast
    FOREIGN KEY (podcast_id)
    REFERENCES Podcast (podcast_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Makes_Podcast_Creator (table: Makes)
ALTER TABLE Makes ADD CONSTRAINT Makes_Podcast_Creator
    FOREIGN KEY (podcast_creator_id)
    REFERENCES Podcast_Creator (podcast_creator_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Playlist_Subscriber (table: Playlist)
ALTER TABLE Playlist ADD CONSTRAINT Playlist_Subscriber
    FOREIGN KEY (email)
    REFERENCES Subscriber (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Podcast_Comments (table: Comments)
ALTER TABLE Comments ADD CONSTRAINT Podcast_Comments
    FOREIGN KEY (podcast_id)
    REFERENCES Podcast (podcast_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Podcast_Creator_Creator (table: Podcast_Creator)
ALTER TABLE Podcast_Creator ADD CONSTRAINT Podcast_Creator_Creator
    FOREIGN KEY (podcast_creator_id)
    REFERENCES Creator (creator_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Reviews_Song (table: Reviews)
ALTER TABLE Reviews ADD CONSTRAINT Reviews_Song
    FOREIGN KEY (song_id)
    REFERENCES Song (song_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Reviews_Subscriber (table: Reviews)
ALTER TABLE Reviews ADD CONSTRAINT Reviews_Subscriber
    FOREIGN KEY (email)
    REFERENCES Subscriber (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Song_Album (table: Song)
ALTER TABLE Song ADD CONSTRAINT Song_Album
    FOREIGN KEY (album_id)
    REFERENCES Album (album_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Streams_Song (table: Streams)
ALTER TABLE Streams ADD CONSTRAINT Streams_Song
    FOREIGN KEY (song_id)
    REFERENCES Song (song_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Streams_Subscriber (table: Streams)
ALTER TABLE Streams ADD CONSTRAINT Streams_Subscriber
    FOREIGN KEY (email)
    REFERENCES Subscriber (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Subscriber_Account (table: Subscriber)
ALTER TABLE Subscriber ADD CONSTRAINT Subscriber_Account
    FOREIGN KEY (account_id)
    REFERENCES Account (account_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Subscriber_Comments (table: Comments)
ALTER TABLE Comments ADD CONSTRAINT Subscriber_Comments
    FOREIGN KEY (email)
    REFERENCES Subscriber (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

