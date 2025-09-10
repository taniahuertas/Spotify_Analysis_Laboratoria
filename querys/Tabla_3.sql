select
SUM(case when track_id is null then 1 else 0 end) as null_track_id,
SUM(case when bpm is null then 1 else 0 end) as null_bpm,
SUM(case when key is null then 1 else 0 end) as null_key,
SUM(case when mode is null then 1 else 0 end) as null_mode,
SUM(case when `danceability_%` is null then 1 else 0 end) as null_danceability,
SUM(case when `valence_%` is null then 1 else 0 end) as null_valence,
SUM(case when `energy_%` is null then 1 else 0 end) as null_energy,
SUM(case when `acousticness_%` is null then 1 else 0 end) as null_acousticness,
SUM(case when `instrumentalness_%` is null then 1 else 0 end) as null_instrumentalness,
SUM(case when `liveness_%` is null then 1 else 0 end) as null_liveness,
SUM(case when `speechiness_%` is null then 1 else 0 end) as null_speechiness,

--select `energy_%`
from `spotify_2023.track_technical_info - technical_info`

-- duplicados
/*select 
coalesce(REGEXP_REPLACE(key, r'[^a-zA-Z0-9 ]',''),'Sin información') as key,
count(*) as conteo
from `spotify_2023.track_technical_info - technical_info`
group by 1*/

-- duplicados
select track_id,count(*) as conteo
from `spotify_2023.track_technical_info - technical_info`
group by track_id
order by conteo desc

SELECT
REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]','') as track_id,
bpm,coalesce(REGEXP_REPLACE(key, r'[^a-zA-Z0-9 ]',''),'Sin información') as key,mode,`danceability_%`as danceability_rate,`valence_%` as valence_rate,`energy_%` as energy_rate,`acousticness_%`as acousticness_rate,`instrumentalness_%` as instrumentalness_rate,`liveness_%`as liveness_rate,`speechiness_%` as speechiness_rate,

from `spotify_2023.track_technical_info - technical_info`

-- ###############################QUERY_3_FINAL###############################################

WITH tabla_3_limpia as (SELECT
REGEXP_REPLACE(track_id, r'[^a-zA-Z0-9 ]','') as track_id,
bpm,coalesce(REGEXP_REPLACE(key, r'[^a-zA-Z0-9 ]',''),'Sin información') as key,mode,`danceability_%`as danceability_rate,`valence_%` as valence_rate,`energy_%` as energy_rate,`acousticness_%`as acousticness_rate,`instrumentalness_%` as instrumentalness_rate,`liveness_%`as liveness_rate,`speechiness_%` as speechiness_rate,

from `spotify_2023.track_technical_info - technical_info`)

select *
from tabla_3_limpia