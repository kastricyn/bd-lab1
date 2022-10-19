set SCHEMA 's311734';


CREATE TABLE "people"(
    "id" BIGSERIAL PRIMARY KEY,
    "surname" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "birthdate" DATE NOT NULL,
    "wisedom" INTEGER NOT NULL DEFAULT 0 CHECK ("wisedom" >= 0)
); 

CREATE TABLE "passport"(
    "series" INTEGER NOT NULL,
    "number" INTEGER NOT NULL,
    "when-given" DATE NOT NULL,
    "who-given" VARCHAR(255) NOT NULL,
    "people_id" BIGINT NULL,
    PRIMARY KEY (series, number)
);

CREATE TABLE "city"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NULL,
    "location_id" BIGINT NOT NULL
);

CREATE TABLE "input-output"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "direction_id" SMALLINT NOT NULL,
    "city_id" INTEGER NOT NULL,
    "location_id" BIGINT NOT NULL
);

CREATE TABLE "location"(
    "id" BIGSERIAL PRIMARY KEY,
    "radius" DOUBLE PRECISION NOT NULL CHECK ("radius" >= 0),
    "center-coordination" POINT NOT NULL,
    "type_id" INTEGER NOT NULL
);

CREATE TABLE "location-type"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE "build"(
    "id" BIGSERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "location_id" INTEGER NOT NULL,
    "length" INTEGER NOT NULL,
    "width" INTEGER NOT NULL,
    "heigh" INTEGER NOT NULL,
    "date_building" DATE NOT NULL
);

CREATE TABLE "research"(
    "people_id" BIGINT REFERENCES "people" ("id") ON DELETE CASCADE,
    "build_id" BIGINT REFERENCES "build" ON DELETE CASCADE,
    "percent" DOUBLE PRECISION DEFAULT 0 NOT NULL,
    PRIMARY KEY(people_id, build_id),
    CONSTRAINT "percent_must_be_GE_0_LE_100" CHECK (percent >= 0 AND percent <= 100)
);

CREATE TABLE "direction"(
    "id" SMALLSERIAL PRIMARY KEY,
    "name" VARCHAR(255) UNIQUE NOT NULL
);

ALTER TABLE
    "input-output" ADD CONSTRAINT "input_output_city_id_foreign" FOREIGN KEY("city_id") REFERENCES "city"("id") ON DELETE CASCADE;
ALTER TABLE
    "city" ADD CONSTRAINT "city_location_id_foreign" FOREIGN KEY("location_id") REFERENCES "location"("id") ON DELETE CASCADE;
ALTER TABLE
    "passport" ADD CONSTRAINT "passport_people_id_foreign" FOREIGN KEY("people_id") REFERENCES "people"("id") ON DELETE CASCADE;
ALTER TABLE
    "build" ADD CONSTRAINT "build_location_id_foreign" FOREIGN KEY("location_id") REFERENCES "location"("id") ON DELETE CASCADE;
ALTER TABLE
    "input-output" ADD CONSTRAINT "input_output_location_id_foreign" FOREIGN KEY("location_id") REFERENCES "location"("id") ON DELETE CASCADE;
ALTER TABLE
    "location" ADD CONSTRAINT "location_type_id_foreign" FOREIGN KEY("type_id") REFERENCES "location-type"("id") ON DELETE CASCADE;
ALTER TABLE
    "input-output" ADD CONSTRAINT "input_output_direction_id_foreign" FOREIGN KEY("direction_id") REFERENCES "direction"("id") ON DELETE CASCADE;