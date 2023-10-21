/*
  Warnings:

  - You are about to drop the `coinexchange` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `userWalletId` to the `Payment` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `coinexchange` DROP FOREIGN KEY `CoinExchange_paymentId_fkey`;

-- DropForeignKey
ALTER TABLE `coinexchange` DROP FOREIGN KEY `CoinExchange_userWalletId_fkey`;

-- AlterTable
ALTER TABLE `payment` ADD COLUMN `userWalletId` INTEGER NOT NULL;

-- DropTable
DROP TABLE `coinexchange`;

-- AddForeignKey
ALTER TABLE `Payment` ADD CONSTRAINT `Payment_userWalletId_fkey` FOREIGN KEY (`userWalletId`) REFERENCES `UserWallet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
