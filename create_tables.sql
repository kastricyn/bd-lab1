-- DROP SCHEMA s311734 CASCADE;
-- CREATE SCHEMA s311734;

CREATE TABLE "people"(
    "id" BIGINT PRIMARY KEY,
    "surname" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "birthdate" DATE NOT NULL,
    "wisedom" INTEGER NOT NULL
); 

CREATE TABLE "passport"(
    "series" INTEGER NOT NULL,
    "number" INTEGER NOT NULL,
    "when-given" VARCHAR(255) NOT NULL,
    "who-given" VARCHAR(255) NOT NULL,
    "people_id" BIGINT NULL,
    PRIMARY KEY (series, number)
);

CREATE TABLE "city"(
    "id" INTEGER PRIMARY KEY,
    "name" VARCHAR(255) NULL,
    "location_id" INTEGER NOT NULL
);

CREATE TABLE "input-output"(
    "id" INTEGER PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "direction_id" SMALLINT NOT NULL,
    "city_id" INTEGER NOT NULL,
    "location_id" BIGINT NOT NULL
);

CREATE TABLE "location"(
    "id" BIGINT PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "radius" DOUBLE PRECISION NOT NULL,
    "center-coordination-latitude" DOUBLE PRECISION NOT NULL,
    "center-coordinates-longitude" DOUBLE PRECISION NOT NULL,
    "type_id" INTEGER NOT NULL
);

CREATE TABLE "location-type"(
    "id" INTEGER PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "build"(
    "id" BIGINT PRIMARY KEY,
    "location_id" INTEGER NOT NULL,
    "length" INTEGER NOT NULL,
    "width" INTEGER NOT NULL,
    "heigh" INTEGER NOT NULL,
    "date_building" DATE NOT NULL
);

CREATE TABLE "research"(
    "people_id" BIGINT NOT NULL,
    "build_id" BIGINT NOT NULL,
    "percent" DOUBLE PRECISION NOT NULL,
    PRIMARY KEY(people_id, build_id)
);

CREATE TABLE "direction"(
    "id" SMALLINT PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

ALTER TABLE
    "input-output" ADD CONSTRAINT "input_output_city_id_foreign" FOREIGN KEY("city_id") REFERENCES "city"("id");
ALTER TABLE
    "city" ADD CONSTRAINT "city_location_id_foreign" FOREIGN KEY("location_id") REFERENCES "location"("id");
ALTER TABLE
    "passport" ADD CONSTRAINT "passport_people_id_foreign" FOREIGN KEY("people_id") REFERENCES "people"("id");
ALTER TABLE
    "build" ADD CONSTRAINT "build_location_id_foreign" FOREIGN KEY("location_id") REFERENCES "location"("id");
ALTER TABLE
    "input-output" ADD CONSTRAINT "input_output_location_id_foreign" FOREIGN KEY("location_id") REFERENCES "location"("id");
ALTER TABLE
    "location" ADD CONSTRAINT "location_type_id_foreign" FOREIGN KEY("type_id") REFERENCES "location-type"("id");
ALTER TABLE
    "input-output" ADD CONSTRAINT "input_output_direction_id_foreign" FOREIGN KEY("direction_id") REFERENCES "direction"("id");