INSERT INTO "location-type" (name) VALUES ('city');
INSERT INTO "location-type" (name) VALUES ('build');
INSERT INTO "location-type" (name) VALUES ('input-output');

WITH rows AS (
INSERT INTO "location" (radius, "center-coordination", type_id) 
    VALUES ( 10.5, POINT(0.5, 0.5), 
        (SELECT id FROM "location-type" WHERE name = 'city' LIMIT 1)
) RETURNING id)
INSERT INTO "city" (name, location_id) VALUES ('MainCity', (SELECT * FROM rows));

-- INSERT INTO "location" (name, radius, "center-coordination", type_id) 
--     VALUES ('RighCity', 10.5, POINT(10.5, 0), 
--         (SELECT id FROM "location-type" WHERE name = 'city' LIMIT 1)
-- );

-- INSERT INTO "city" (name, location_id) VALUES ('RighCity',
--     (SELECT id FROM "location" WHERE name = 'RighCity' LIMIT 1)
-- );

-- INSERT INTO "location" (name, radius, "center-coordination", type_id) 
--     VALUES ('SlowAloneCity', 1, POINT(10.5, 3), 
--         (SELECT id FROM "location-type" WHERE name = 'city' LIMIT 1)
-- );

-- INSERT INTO "city" (name, location_id) VALUES ('RighCity',
--     (SELECT id FROM "location" WHERE name = 'RighCity' LIMIT 1)
-- );




