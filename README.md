# 🎵 Integración y Limpieza de Datos de Canciones (Spotify, Apple, Deezer, Shazam)

## 📌 Descripción

Este script en SQL (BigQuery) integra y normaliza información de canciones 🎶 provenientes de múltiples fuentes de streaming y rankings musicales (Spotify, Apple Music, Deezer, Shazam). El objetivo es consolidar en una sola tabla variables clave sobre popularidad (playlists, charts, streams) y características técnicas (BPM, energía, valencia, etc.), para facilitar:

- 🔎 Análisis de mercado
- 📈 Predicción de éxito musical
- 📊 Construcción de dashboards

## 🗂️ Estructura del Script

El código se organiza en CTEs de limpieza y un bloque final de unión:

  1️⃣ tabla_1_limpia
  
  - 📂 Fuente: track_in_competition
  - 🔧 Procesos:
      - Limpieza de track_id 🧹
      - Normalización de playlists y charts (Apple 🍏, Deezer 🎧, Shazam 🔮)
      - COALESCE para evitar nulos
        
  2️⃣ query_1_final
  
  - ➕ Variables derivadas:
      - total_playlists = Apple + Deezer
      - total_charts = Apple + Deezer + Shazam

  3️⃣ tabla_2_limpia
  
  - 📂 Fuente: track_in_spotify
  - 🔧 Procesos:
      - Limpieza de track_id, track_name, artist_name ✍️
      - Conversión de fecha de lanzamiento 📅 (released_year + released_month + released_day)
      - Conversión segura de streams a BIGNUMERIC 🔢

  4️⃣ tabla_3_limpia
  
  - 📂 Fuente: track_technical_info
  - 🔧 Procesos:
      - Limpieza de track_id y key 🎹
      - Normalización de variables técnicas de audio 🎶:
      - bpm ⏱️
      - danceability_rate 💃
      - valence_rate 😀
      - energy_rate ⚡
      - acousticness_rate 🎸
      - instrumentalness_rate 🎻
      - liveness_rate 🎤
      - speechiness_rate 🗣️
  
  5️⃣ Consulta Final
  
  - 🔗 Unión de las tres tablas limpias con LEFT JOIN
  - 🎯 Resultado consolidado con:
      - Metadata (🎵 canción, 👤 artista, 📅 fecha de lanzamiento)
      - Popularidad en playlists y charts 📊
      - Totales (total_playlists, total_charts)
      - Streams 💽
      - Atributos técnicos 🎶

## 🔑 Variables Clave del Resultado

  - 🆔 track_id, track_name, artist_name
  - 📅 released_date
  - 🎧 in_spotify_playlists, in_apple_playlists, in_deezer_playlists
  - 📊 in_spotify_charts, in_apple_charts, in_deezer_charts, in_shazam_charts
  - ➕ total_playlists, total_charts
  - 💽 streams
  - 🎹 bpm, key, mode
  - 🎶 danceability_rate, valence_rate, energy_rate, acousticness_rate, instrumentalness_rate, liveness_rate, speechiness_rate

## 🚀 Posibles Usos

  - 🔎 *Análisis exploratorio:* comparar características musicales con éxito.
  - 🤖 *Machine Learning:* entrenar modelos para predecir streams/playlists.
  - ⚔️ *Benchmark competitivo:* contrastar plataformas de streaming.
  - 📊 *Dashboards ejecutivos:* visualizaciones en Looker Studio / Power BI.

## ⚙️ Notas Técnicas

  - 🧹 Limpieza con REGEXP_REPLACE
  - 🛡️ Robustez con COALESCE y SAFE_CAST
  - ✅ Bloque comentado al final para validación de duplicados (count distinct track_id)

*Nota:* Este proyecto hace parte de mi formación como Analista de Datos en el Bootcamp Skill Up Data de Laboratoria. 
