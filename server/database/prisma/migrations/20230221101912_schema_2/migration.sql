/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Garage` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Garage` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Reservation` table. All the data in the column will be lost.
  - You are about to drop the column `date` on the `Reservation` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Reservation` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Reservation` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Reservation` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Reservation` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Vehicle` table. All the data in the column will be lost.
  - You are about to drop the column `licensePlate` on the `Vehicle` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Vehicle` table. All the data in the column will be lost.
  - You are about to drop the column `vehicleType` on the `Vehicle` table. All the data in the column will be lost.
  - You are about to drop the `GarageReservation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GarageSpots` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `city` to the `Garage` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endDate` to the `Reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `garageId` to the `Reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `spotId` to the `Reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startDate` to the `Reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `vehicleId` to the `Reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `plate` to the `Vehicle` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `Vehicle` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Vehicle` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "SpotStatus" AS ENUM ('AVAILABLE', 'RESERVED', 'OCCUPIED');

-- DropForeignKey
ALTER TABLE "GarageReservation" DROP CONSTRAINT "GarageReservation_garageId_fkey";

-- DropForeignKey
ALTER TABLE "GarageReservation" DROP CONSTRAINT "GarageReservation_reservationId_fkey";

-- DropForeignKey
ALTER TABLE "GarageReservation" DROP CONSTRAINT "GarageReservation_vehicleId_fkey";

-- DropForeignKey
ALTER TABLE "GarageSpots" DROP CONSTRAINT "GarageSpots_garageId_fkey";

-- DropForeignKey
ALTER TABLE "GarageSpots" DROP CONSTRAINT "GarageSpots_reservationId_fkey";

-- DropForeignKey
ALTER TABLE "GarageSpots" DROP CONSTRAINT "GarageSpots_vehicleId_fkey";

-- DropIndex
DROP INDEX "Reservation_email_idx";

-- DropIndex
DROP INDEX "Vehicle_licensePlate_idx";

-- AlterTable
ALTER TABLE "Garage" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "city" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Reservation" DROP COLUMN "createdAt",
DROP COLUMN "date",
DROP COLUMN "email",
DROP COLUMN "name",
DROP COLUMN "phone",
DROP COLUMN "updatedAt",
ADD COLUMN     "endDate" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "garageId" TEXT NOT NULL,
ADD COLUMN     "spotId" TEXT NOT NULL,
ADD COLUMN     "startDate" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL,
ADD COLUMN     "vehicleId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Vehicle" DROP COLUMN "createdAt",
DROP COLUMN "licensePlate",
DROP COLUMN "updatedAt",
DROP COLUMN "vehicleType",
ADD COLUMN     "plate" TEXT NOT NULL,
ADD COLUMN     "type" "VehicleType" NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL;

-- DropTable
DROP TABLE "GarageReservation";

-- DropTable
DROP TABLE "GarageSpots";

-- CreateTable
CREATE TABLE "Spot" (
    "id" TEXT NOT NULL,
    "garageId" TEXT NOT NULL,
    "status" "SpotStatus" NOT NULL,
    "vehicleType" "VehicleType"[],

    CONSTRAINT "Spot_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Spot_garageId_idx" ON "Spot"("garageId");

-- CreateIndex
CREATE INDEX "Reservation_userId_garageId_spotId_vehicleId_idx" ON "Reservation"("userId", "garageId", "spotId", "vehicleId");

-- CreateIndex
CREATE INDEX "Vehicle_plate_idx" ON "Vehicle"("plate");

-- AddForeignKey
ALTER TABLE "Spot" ADD CONSTRAINT "Spot_garageId_fkey" FOREIGN KEY ("garageId") REFERENCES "Garage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reservation" ADD CONSTRAINT "Reservation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reservation" ADD CONSTRAINT "Reservation_garageId_fkey" FOREIGN KEY ("garageId") REFERENCES "Garage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reservation" ADD CONSTRAINT "Reservation_spotId_fkey" FOREIGN KEY ("spotId") REFERENCES "Spot"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reservation" ADD CONSTRAINT "Reservation_vehicleId_fkey" FOREIGN KEY ("vehicleId") REFERENCES "Vehicle"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "Vehicle_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
