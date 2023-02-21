CREATE TYPE "VehicleType" AS ENUM (
  'CAR',
  'MOTORCYCLE',
  'BIKE'
);

CREATE TYPE "SpotStatus" AS ENUM (
  'AVAILABLE',
  'RESERVED',
  'OCCUPIED'
);

CREATE TYPE "UserRole" AS ENUM (
  'ADMIN',
  'USER'
);

CREATE TABLE "User" (
  "id" String PRIMARY KEY,
  "email" String UNIQUE NOT NULL,
  "name" String NOT NULL,
  "password" String NOT NULL,
  "role" UserRole NOT NULL,
  "createdAt" DateTime NOT NULL DEFAULT (now()),
  "updatedAt" DateTime NOT NULL,
  "Reservation" Reservation NOT NULL,
  "Vehicle" Vehicle NOT NULL
);

CREATE TABLE "Garage" (
  "id" String PRIMARY KEY,
  "name" String NOT NULL,
  "zipcode" String NOT NULL,
  "address" String NOT NULL,
  "country" String NOT NULL,
  "city" String NOT NULL,
  "Spot" Spot NOT NULL,
  "Reservation" Reservation NOT NULL
);

CREATE TABLE "Spot" (
  "id" String PRIMARY KEY,
  "garageId" String NOT NULL,
  "garage" Garage NOT NULL,
  "status" SpotStatus NOT NULL,
  "vehicleType" VehicleType[] NOT NULL,
  "Reservation" Reservation NOT NULL
);

CREATE TABLE "Reservation" (
  "id" String PRIMARY KEY,
  "userId" String NOT NULL,
  "user" User NOT NULL,
  "garageId" String NOT NULL,
  "garage" Garage NOT NULL,
  "spotId" String NOT NULL,
  "spot" Spot NOT NULL,
  "vehicleId" String NOT NULL,
  "vehicle" Vehicle NOT NULL,
  "startDate" DateTime NOT NULL,
  "endDate" DateTime NOT NULL
);

CREATE TABLE "Vehicle" (
  "id" String PRIMARY KEY,
  "userId" String NOT NULL,
  "user" User NOT NULL,
  "type" VehicleType NOT NULL,
  "plate" String NOT NULL,
  "Reservation" Reservation NOT NULL
);

ALTER TABLE "Spot" ADD FOREIGN KEY ("garageId") REFERENCES "Garage" ("id");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("userId") REFERENCES "User" ("id");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("garageId") REFERENCES "Garage" ("id");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("spotId") REFERENCES "Spot" ("id");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("vehicleId") REFERENCES "Vehicle" ("id");

ALTER TABLE "Vehicle" ADD FOREIGN KEY ("userId") REFERENCES "User" ("id");
