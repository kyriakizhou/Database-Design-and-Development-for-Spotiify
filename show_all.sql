\! echo "Subscriber table: Show information of all Spotify subscribers. Table includes columns emails, name, gender, region. \n";
SELECT email, name, gender, region FROM Subscriber;

\! echo "Playlist table: Show information of playlists created by all subscribers. Table includes playlist_id, name, description, and email. Each playlist is only built by one subscriber, and a subscriber can create 0 or multiple playlists.\n";
SELECT playlist_id, name, description, email FROM Playlist;

\! echo "Song table: Show information of song consist of columns song_id, title, genre, duration, album_id";
SELECT * FROM Song;

\! echo "Account table: Show information of all account types offered by Spority. Table is consisted of columns account_id, type";
SELECT * FROM Account;

\! echo "Album table: Show information of albums consist of columns album_id, name, release_date";
SELECT * FROM Album;

\! echo "Artist table: Show information of all artists. The table has a single column artist_id";
SELECT * FROM Artist;

\! echo "Comments table: Show information of comments made by a subscriber to a podcast. The table is consisted of columns comment_id, email, podcast_id, comment, rating";
SELECT * FROM Comments;

\! echo "Contains table: Show information of containment between playlist and podcasts. The table is consisted of columns podcast_id, playlist_id";
SELECT * FROM Contains;

\! echo "Creates table: Show information of ownership of albums. The table consists of columns artist_id, album_id";
SELECT * FROM Creates;

\! echo "Creator table: Show information of all song/podcast creators. The table is consisted of creator_id, name, monthly_listenser";
SELECT * FROM Creator;

\! echo "Friends table: Show information of friend relationship between subscribers. The table is consisted of email1, email2";
SELECT * FROM Friends;

\! echo "Incorporates table: Show information of containment between song and playlist. The table is consisted of columns song_id, playlist_id";
SELECT * FROM Incorporates;

\! echo "Listens table: Show information of each listen record. The tale is consisted of columns listen_id, podcast_id, email, listen_time";
SELECT * FROM Listens;

\! echo "Makes table: Show information of ownership of all podcasts. The table is consisted of columns podcast_id, podcast_creator_id";
SELECT * FROM Makes;

\! echo "Podcast table: Show information of all podcasts. The table is consisted of columns podcast_id, title, topic, duration";
SELECT * FROM Podcast;

\! echo "Podcast_Creator table: Show information of all podcast_creators. The table is consisted of a single column podcast_creator_id";
SELECT * FROM Podcast_Creator;

\! echo "Reviews table: Show information of reviews consist of columns email, song_id, review, rating";
SELECT * FROM Reviews;

\! echo "Streams table: Show information of each streamming record. The table is consisted of stream_id, email, song_id, stream_time";
SELECT * FROM Streams;
