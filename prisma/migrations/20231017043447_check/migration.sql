/*
  Warnings:

  - You are about to drop the column `exchangeRateId` on the `coinexchange` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `coinexchange` DROP FOREIGN KEY `CoinExchange_exchangeRateId_fkey`;

-- AlterTable
ALTER TABLE `coinexchange` DROP COLUMN `exchangeRateId`;
