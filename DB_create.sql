CREATE TABLE IF NOT EXISTS genre (
    PRIMARY KEY (genre_id),
    genre_id   SERIAL,
    genre_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
    PRIMARY KEY (artist_id),
    artist_id   SERIAL,
    artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_artist (
    PRIMARY KEY (genre_id, artist_id),
    genre_id  INTEGER REFERENCES genre (genre_id),
    artist_id INTEGER REFERENCES artist (artist_id)
);

CREATE TABLE IF NOT EXISTS album (
    PRIMARY KEY (album_id),
    album_id   SERIAL,
    album_name VARCHAR(50) NOT NULL,
    album_year INTEGER     NOT NULL,
               CONSTRAINT album_year_range
               CHECK (album_year > 0)
);

CREATE TABLE IF NOT EXISTS artist_album (
    PRIMARY KEY (artist_id, album_id),
    artist_id INTEGER REFERENCES artist (artist_id),
    album_id  INTEGER REFERENCES album (album_id)
);

CREATE TABLE IF NOT EXISTS track (
    PRIMARY KEY (track_id),
    track_id       SERIAL,
    track_name     VARCHAR(50) NOT NULL,
    track_duration INTEGER     NOT NULL,
                   CONSTRAINT track_duration_range
                   CHECK (track_duration > 0),
    album_id       INTEGER     REFERENCES album (album_id)
);

CREATE TABLE IF NOT EXISTS collection (
    PRIMARY KEY (collection_id),
    collection_id   SERIAL,
    collection_name VARCHAR(50) NOT NULL,
    collection_year INTEGER     NOT NULL,
                    CONSTRAINT collection_year_range
                    CHECK (collection_year > 0)
);

CREATE TABLE IF NOT EXISTS collection_track (
    PRIMARY KEY (collection_id, track_id),
    collection_id INTEGER REFERENCES collection (collection_id),
    track_id      INTEGER REFERENCES track (track_id)
);
