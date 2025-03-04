{{ config(materialized='table') }}

SELECT
    station_regions.region_name,
    COUNT(trips.trip_id) AS TRIPS
FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips` AS trips
LEFT JOIN {{ ref('station_regions') }} AS station_regions
    ON trips.start_station_id = station_regions.station_id
GROUP BY 1