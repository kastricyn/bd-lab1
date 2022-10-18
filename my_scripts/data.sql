INSERT INTO "location-type" (name) VALUES ('city');
INSERT INTO "location-type" (name) VALUES ('build');
INSERT INTO "location-type" (name) VALUES ('input-output');


-- вставляем города

WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 10, POINT(0, 0), 
        (SELECT id FROM "location-type" WHERE name = 'city')
) RETURNING id)
INSERT INTO "city" (name, location_id) VALUES ('MainCity', (SELECT * FROM rows));

WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 3, POINT(-2.5, 0), 
        (SELECT id FROM "location-type" WHERE name = 'city')
) RETURNING id)
INSERT INTO "city" (name, location_id) VALUES ('LeftCity', (SELECT * FROM rows));

WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 1.44, POINT(-5, 5), 
        (SELECT id FROM "location-type" WHERE name = 'city')
) RETURNING id)
INSERT INTO "city" (name, location_id) VALUES ('SlowAloneCity', (SELECT * FROM rows));


-- вставляем здания

WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 1, POINT(0, 5.5), 
        (SELECT id FROM "location-type" WHERE name = 'build')
) RETURNING id)
INSERT INTO "build" (name, location_id, length, width, heigh, date_building) 
VALUES ('Build in the top of MainCity', (SELECT * FROM rows), 10, 20, 30, '2001-02-16');

WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 0.5, POINT(5, 4), 
        (SELECT id FROM "location-type" WHERE name = 'build')
) RETURNING id)
INSERT INTO "build" (name, location_id, length, width, heigh, date_building) 
VALUES ('Здание в захалуйстье', (SELECT * FROM rows), 10, 20, 30, now());

WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 1, POINT(-5, 3), 
        (SELECT id FROM "location-type" WHERE name = 'build')
) RETURNING id)
INSERT INTO "build" (name, location_id, length, width, heigh, date_building) 
VALUES ('Build in all of the three cities', (SELECT * FROM rows), 10, 20, 30, '10/27/2002');

WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 1, POINT(2, 0), 
        (SELECT id FROM "location-type" WHERE name = 'build')
) RETURNING id)
INSERT INTO "build" (name, location_id, length, width, heigh, date_building) 
VALUES ('Build in the big city', (SELECT * FROM rows), 10, 20, 30, '09.10.2020');


WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 0.5, POINT(-4, -2), 
        (SELECT id FROM "location-type" WHERE name = 'build')
) RETURNING id)
INSERT INTO "build" (name, location_id, length, width, heigh, date_building) 
VALUES ('Build in the two bigest cities', (SELECT * FROM rows), 10, 20, 30, now());




