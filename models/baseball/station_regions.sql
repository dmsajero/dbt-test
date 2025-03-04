{{ config(materialized='view') }}

SELECT
    regions.region_id as region_id,
    regions.name as region_name,
    CAST(stations.station_id AS INTEGER) AS station_id
FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` AS stations
LEFT JOIN `bigquery-public-data.san_francisco_bikeshare.bikeshare_regions` AS regions
    ON stations.region_id = regions.region_id