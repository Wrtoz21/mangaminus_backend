/*
  Warnings:

  - You are about to drop the column `BankName` on the `payment` table. All the data in the column will be lost.
  - You are about to drop the column `BankNumber` on the `payment` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `payment` DROP COLUMN `BankName`,
    DROP COLUMN `BankNumber`;
