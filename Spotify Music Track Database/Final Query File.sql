-- 1. Total tracks
SELECT COUNT(*) AS `total music tracks` FROM songs_data;

-- 1. Total dinstinct tracks
SELECT COUNT(DISTINCT(track_name)) AS `Total Distinct Tracks` FROM songs_data;

-- 2. top 10 songs with more than 1 artists
SELECT 
    track_name AS `Track Name`, 
    artist_count AS `Total Artists`
FROM
    songs_data
WHERE
    artist_count > 1
ORDER BY artist_count DESC
LIMIT 10;


-- 3. top 10 years with most track release
SELECT 
    released_year AS `Year`,
    COUNT(track_name) AS `Total Trackst`
FROM
    songs_data
GROUP BY `Year`
ORDER BY `Total Trackst` DESC
LIMIT 10;

-- 4. Song with maximum stream count
SELECT 
    track_name AS `Track Name`,
    `artist(s)_name` AS `Artist Name`,
    released_year AS `Year of Release`,
    streams AS `Total Streams`
FROM
    songs_data
WHERE
    streams = (SELECT 
            MAX(streams)
        FROM
            songs_data);
            

-- 5. Total tracks of every month of every year
SELECT 
	released_year AS `Year`,
    released_month AS `Month`,
    COUNT(track_name) AS `Total Tracks`
FROM 
	songs_data
GROUP BY 
	released_year,
    released_month
ORDER BY 
	released_year DESC,
    released_month;
    
-- 6. distinct tones of the tracks
SELECT DISTINCT
    (song_key) AS tone
FROM
    songs_data
ORDER BY song_key;

-- 7. track details of specific artist
SELECT 
	track_name AS `Track Name`,
    released_year AS `Year`,
    `in_spotify_playlists` AS `Total Playlists track present`,
    streams AS `Total stream count`
FROM
    songs_data
WHERE
    `artist(s)_name` = 'Taylor Swift';
    
    
-- 8. Tracks with MAX and MIN Playlist Count
SELECT 
    track_name AS `Track Name`,
    `artist(s)_name` AS `Artists`,
    released_year AS `Year`,
    released_month AS `Month`,
    streams AS `Stream Count`,
    `in_spotify_playlists` AS `Playlists has`
FROM
    songs_data
WHERE
    `in_spotify_playlists` = (SELECT 
            MAX(`in_spotify_playlists`)
        FROM
            songs_data);
            
SELECT 
    track_name AS `Track Name`,
    `artist(s)_name` AS `Artists`,
    released_year AS `Year`,
    released_month AS `Month`,
    streams AS `Stream Count`,
    `in_spotify_playlists` AS `Playlists has`
FROM
    songs_data
WHERE
    `in_spotify_playlists` = (SELECT 
            MIN(`in_spotify_playlists`)
        FROM
            songs_data);
            
-- 9. Distinct Modes and track count per modes
SELECT DISTINCT
    (`mode`)
FROM
    songs_data;
    
SELECT 
	`mode`,
    COUNT(*) AS `Total tracks`
FROM 
	songs_data
GROUP BY `mode`;
