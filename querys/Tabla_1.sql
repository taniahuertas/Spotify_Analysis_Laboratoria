/*SELECT 
  SUM(case when track_id is null then 1 else 0 end) as null_track_id
  ,SUM(case when in_apple_playlists is null then 1 else 0 end) as in_apple_playlists_nulls
  ,SUM(case when in_apple_charts is null then 1 else 0 end) as in_apple_charts_nulls
  ,SUM(case when in_deezer_playlists is null then 1 else 0 end) as in_deezer_playlists_nulls
  ,SUM(case when in_deezer_charts is null then 1 else 0 end) as in_deezer_charts_nulls
  ,SUM(case when in_shazam_charts is null then 1 else 0 end) as in_shazam_charts_nulls
FROM `proyecto-2-laboratoria-469821.spotify_2023.track_in_competition - competition`*/

WITH tabla_1_limpia AS (
 select REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]','') as track_id,in_apple_playlists,in_apple_charts,in_deezer_playlists,in_deezer_charts
    ,COALESCE(in_shazam_charts,0)AS in_shazam_charts
--Función COALESCE imputa (rellena) valores nulos por un valor indicado, en este caso 0

FROM `proyecto-2-laboratoria-469821.spotify_2023.track_in_competition - competition`)

-- Conteo de registros por track_id: Se comprueba que no hay duplicados 
-- select track_id,count (*) as conteo
-- from clean_data
-- group by track_id
-- order by conteo desc

/*select * 
from(
  SELECT * , REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]', ' ') AS track_id2 FROM clean_data)
--Filtro para identificar que los track_ids sean distintos (solo para verificar)
WHERE track_id <> track_id2*/

--Para verificar la distribución sin profundizar de cada columna numérica evidenciando si la media está muy alejada de los valores extremos
/*select 
  min(in_apple_playlists) as min_in_apple_playlists,
  max(in_apple_playlists) as max_in_apple_playlists,
  round(avg(in_apple_playlists),0) as avg_in_apple_playlists,
  min(in_apple_charts) as min_in_apple_charts,
  max(in_apple_charts) as max_in_apple_charts,
  round(avg(in_apple_charts),0) as avg_in_apple_charts,
  min(in_deezer_playlists) as min_in_deezer_playlists,
  max(in_deezer_playlists) as max_in_deezer_playlists,
  round(avg(in_deezer_playlists),0) as avg_in_deezer_playlists,
  min(in_deezer_charts) as min_in_deezer_charts,
  max(in_deezer_charts) as max_in_deezer_charts,
  round(avg(in_deezer_charts),0) as avg_in_deezer_charts,
  min(in_shazam_charts) as min_in_shazam_charts,
  max(in_shazam_charts) as max_in_shazam_charts,
  round(avg(in_shazam_charts),0) as avg_in_shazam_charts*/


--Para crear variables
SELECT *
, in_apple_playlists + in_deezer_playlists as total_playlists
, in_apple_charts + in_deezer_charts + in_shazam_charts as total_charts
from tabla_1_limpia



-- ###############################QUERY_1_FINAL###############################################
WITH tabla_1_limpia AS (
 select REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]','') as track_id,in_apple_playlists,in_apple_charts,in_deezer_playlists,in_deezer_charts
    ,COALESCE(in_shazam_charts,0)AS in_shazam_charts
    FROM `proyecto-2-laboratoria-469821.spotify_2023.track_in_competition - competition`)

, query_1_final as (SELECT *
, in_apple_playlists + in_deezer_playlists as total_playlists
, in_apple_charts + in_deezer_charts + in_shazam_charts as total_charts
from tabla_1_limpia)

select * 
from query_1_final