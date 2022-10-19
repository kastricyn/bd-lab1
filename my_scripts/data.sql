set schema 's311734';


INSERT INTO "location-type" (name) VALUES ('city');
INSERT INTO "location-type" (name) VALUES ('build');
INSERT INTO "location-type" (name) VALUES ('input-output');


-- вставляем города

WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 5, POINT(0, 0), 
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
VALUES ('Build in all of the three cities', (SELECT * FROM rows), 10, 20, 30, '2002-10-27');

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


-- вставляем людей
INSERT INTO "people" (surname, name, birthdate) VALUES ('SUR1', 'NAME1', '2000-1-1');
INSERT INTO "people" (surname, name, birthdate) VALUES ('SUR2', 'NAME2', '2000-2-2');
INSERT INTO "people" (surname, name, birthdate) VALUES ('SUR3', 'NAME3', '2000-2-3');

-- добавим паспорта
INSERT INTO "passport" (series, number, "who-given", "when-given") VALUES ('4040', '4568', 'Giver1', now());
INSERT INTO "passport" (series, number, "who-given", "when-given", "people_id") VALUES ('4040', '4562', 'Giver1', now(), 1);
INSERT INTO "passport" (series, number, "who-given", "when-given", "people_id") VALUES ('4000', '4562', 'Giver2', '1965-12-1', 1);
INSERT INTO "passport" (series, number, "who-given", "when-given", "people_id") VALUES ('4000', '4563', 'Giver2', '1965-12-1', 2);

-- add location type input-output
INSERT INTO "location-type" ("name") VALUES ('input'), ('output'), ('bidirection');
