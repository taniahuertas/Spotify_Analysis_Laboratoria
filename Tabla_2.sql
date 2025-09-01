-- Verificar estructura de la tabla 
-- SELECT * FROM `proyecto-2-laboratoria-469821.spotify_2023.track_in_spotify` LIMIT 1000

/*select
  SUM(case when track_id is null then 1 else 0 end) as null_track_id,
SUM(case when track_name is null then 1 else 0 end) as null_track_name,
SUM(case when artist_name is null then 1 else 0 end) as null_artist_name,
SUM(case when artist_count is null then 1 else 0 end) as null_artist_count,
SUM(case when released_year is null then 1 else 0 end) as null_released_year,
SUM(case when released_month is null then 1 else 0 end) as null_released_month,
SUM(case when released_day is null then 1 else 0 end) as null_released_day,
SUM(case when in_spotify_playlists is null then 1 else 0 end) as null_in_spotify_playlists,
SUM(case when in_spotify_charts is null then 1 else 0 end) as null_in_spotify_charts,
SUM(case when streams is null then 1 else 0 end) as null_streams
from `spotify_2023.track_in_spotify`*/

-- duplicados
/*select track_id,count(*) as conteo
from `spotify_2023.track_in_spotify`
group by track_id
order by conteo desc*/

-- select * from `spotify_2023.track_in_spotify`

WITH tabla_2_limpia AS (
  select 
  REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]','') as track_id,
  REGEXP_REPLACE(track_name, r'[^a-zA-Z0-9 ]','') as track_name,
  REGEXP_REPLACE(artist_name, r'[^a-zA-Z0-9 ]','') as artist_name,
  artist_count, 
  --creación de variable de fecha de lanzamiento con concat de año-mes-dia y castearlo de string a fecha (convertir)
  safe_cast (concat(released_year,"-", released_month, "-", released_day)as date) as released_date,
  --released_year, released_month, released_day, 
  in_spotify_playlists, in_spotify_charts, 

  
  coalesce(safe_CAST(streams as BIGNUMERIC),0) as streams
  
FROM `spotify_2023.track_in_spotify`)

/*select 
  min(in_spotify_playlists) as min_in_spotify_playlists,
  max(in_spotify_playlists) as max_in_spotify_playlists,
  round(avg(in_spotify_playlists),0) as avg_in_spotify_playlists,
  
  min(in_spotify_charts) as min_in_spotify_charts,
  max(in_spotify_charts) as max_in_spotify_charts,
  round(avg(in_spotify_charts),0) as avg_in_spotify_charts,

  min(streams) as min_streams,
  max(streams) as max_streams,
  round(avg(streams),0) as avg_streams

from tabla_2_limpia*/

select * 
from tabla_2_limpia

-- ###############################QUERY_2_FINAL###############################################

WITH tabla_2_limpia AS (
  select 
  REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]','') as track_id,
  REGEXP_REPLACE(track_name, r'[^a-zA-Z0-9 ]','') as track_name,
  REGEXP_REPLACE(artist_name, r'[^a-zA-Z0-9 ]','') as artist_name,
  artist_count, 
  safe_cast (concat(released_year,"-", released_month, "-", released_day)as date) as released_date,
  in_spotify_playlists, in_spotify_charts, 

  coalesce(safe_CAST(streams as BIGNUMERIC),0) as streams
  
FROM `spotify_2023.track_in_spotify`)

select * 
from tabla_2_limpia
