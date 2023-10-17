/*
  Warnings:

  - You are about to drop the column `userPaymentNumber` on the `payment` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `payment` DROP COLUMN `userPaymentNumber`,
    ADD COLUMN `userPaymentStatus` ENUM('ALREADY', 'CHECKING') NOT NULL DEFAULT 'CHECKING';
