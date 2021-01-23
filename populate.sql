\copy Account(account_id, account_type) FROM 'data/account.csv' csv header
\copy Subscriber(email, name, gender, region, account_id)  FROM 'data/subscriber.csv' csv header
\copy Playlist(playlist_id, name, description, email)  FROM 'data/playlist.csv' csv header
\copy Podcast(podcast_id, title, topic, duration) FROM 'data/podcast.csv' csv header
\copy Album(album_id, name, release_date) FROM 'data/album.csv' csv header
\copy Song(song_id, title, genre, duration, album_id) FROM 'data/song.csv' csv header
\copy Creator(creator_id, name, monthly_listeners) FROM 'data/creator.csv' csv header
\copy Friends(email1, email2) FROM 'data/friends.csv' csv header
\copy Comments(comment_id, email, podcast_id, comment, rating) FROM 'data/comments.csv' csv header
\copy Listens(listen_id, email, podcast_id, listen_time) FROM 'data/listens.csv' csv header
\copy Reviews(email, song_id, review, rating) FROM 'data/reviews.csv' csv header
\copy Streams(stream_id, email, song_id, stream_time) FROM 'data/streams.csv' csv header
\copy Contains(podcast_id, playlist_id) FROM 'data/contains.csv' csv header
\copy Incorporates(song_id, playlist_id) FROM 'data/incorporates.csv' csv header
\copy Artist(artist_id) FROM 'data/artist.csv' csv header
\copy Creates(artist_id, album_id) FROM 'data/creates.csv' csv header
\copy Podcast_Creator(podcast_creator_id) FROM 'data/podcastCreator.csv' csv header
\copy Makes(podcast_id, podcast_creator_id) FROM 'data/makes.csv' csv header