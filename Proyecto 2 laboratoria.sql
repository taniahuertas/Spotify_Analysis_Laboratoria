WITH tabla_1_limpia AS (
 select REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]','') as track_id,in_apple_playlists,in_apple_charts,in_deezer_playlists,in_deezer_charts
    ,COALESCE(in_shazam_charts,0)AS in_shazam_charts
    FROM `proyecto-2-laboratoria-469821.spotify_2023.track_in_competition - competition`)

, query_1_final as (SELECT *
, in_apple_playlists + in_deezer_playlists as total_playlists
, in_apple_charts + in_deezer_charts + in_shazam_charts as total_charts
from tabla_1_limpia)

, tabla_2_limpia AS (
  select 
  REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]','') as track_id,
  REGEXP_REPLACE(track_name, r'[^a-zA-Z0-9 ]','') as track_name,
  REGEXP_REPLACE(artist_name, r'[^a-zA-Z0-9 ]','') as artist_name,
  artist_count, 
  safe_cast (concat(released_year,"-", released_month, "-", released_day)as date) as released_date,
  in_spotify_playlists, in_spotify_charts, 

  coalesce(safe_CAST(streams as BIGNUMERIC),0) as streams
  
FROM `spotify_2023.track_in_spotify`)

, tabla_3_limpia as (SELECT
REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]','') as track_id,
bpm,coalesce(REGEXP_REPLACE(key, r'[^a-zA-Z0-9 ]',''),'no info') as key,mode,`danceability_%`as danceability_rate,`valence_%` as valence_rate,`energy_%` as energy_rate,`acousticness_%`as acousticness_rate,`instrumentalness_%` as instrumentalness_rate,`liveness_%`as liveness_rate,`speechiness_%` as speechiness_rate,

from `spotify_2023.track_technical_info - technical_info`)

select track_id,track_name,artist_name,artist_count,released_date,in_apple_playlists,in_apple_charts,in_deezer_playlists,in_deezer_charts,in_shazam_charts,in_spotify_playlists,in_spotify_charts,total_playlists + in_spotify_playlists as total_playlists,total_charts + in_spotify_charts as total_charts,streams,bpm,key,mode,danceability_rate,valence_rate,energy_rate,acousticness_rate,instrumentalness_rate,liveness_rate,speechiness_rate
from query_1_final as A
LEFT JOIN tabla_2_limpia as B USING (track_id)
LEFT JOIN tabla_3_limpia as C USING (track_id)

-- SELECT count(distinct track_id) as count_dist,
-- count(*) 
-- from tabla_3_limpia