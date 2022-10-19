set schema 's311734';
-- Отладочный запрос
WITH city AS (
    SELECT * FROM location 
    WHERE type_id IN (SELECT id FROM "location-type" WHERE name IN ('city'))
),
build AS (
    SELECT * FROM location 
    WHERE type_id IN (SELECT id FROM "location-type" WHERE name IN ('build'))
)
SELECT *, lseg(city."center-coordination", build."center-coordination"), length(lseg(city."center-coordination", build."center-coordination")), abs(city.radius - build.radius) FROM build, city ;
-- ON length(lseg(city."center-coordination", build."center-coordination")) <= abs(city.radius + build.radius);

WITH city AS (
    SELECT * FROM location 
    WHERE type_id IN (SELECT id FROM "location-type" WHERE name IN ('city'))
),
build AS (
    SELECT * FROM location 
    WHERE type_id IN (SELECT id FROM "location-type" WHERE name IN ('build'))
)
SELECT *, lseg(city."center-coordination", build."center-coordination"), length(lseg(city."center-coordination", build."center-coordination")), abs(city.radius - build.radius) FROM build JOIN city 
ON length(lseg(city."center-coordination", build."center-coordination")) <= abs(city.radius + build.radius);

-- Список всех зданий, которые пересекаются с городами
WITH city AS (
    SELECT * FROM location 
    WHERE type_id IN (SELECT id FROM "location-type" WHERE name IN ('city'))
),
build_location AS (
    SELECT * FROM location 
    WHERE type_id IN (SELECT id FROM "location-type" WHERE name IN ('build'))
),
build_id AS(
    SELECT DISTINCT build_location.id FROM build_location JOIN city 
    ON length(lseg(city."center-coordination", build_location."center-coordination")) <= abs(city.radius + build_location.radius)
)
SELECT * FROM build JOIN build_id ON build.location_id = build_id.id;