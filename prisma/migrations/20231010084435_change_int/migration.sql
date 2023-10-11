/*
  Warnings:

  - You are about to drop the column `commentId` on the `user` table. All the data in the column will be lost.
  - Added the required column `userId` to the `Comment` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `User_commentId_fkey`;

-- AlterTable
ALTER TABLE `comment` ADD COLUMN `userId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `commentId`,
    MODIFY `mobilePhone` VARCHAR(191) NOT NULL,
    MODIFY `userRole` ENUM('ADMIN', 'USER') NOT NULL DEFAULT 'USER';

-- CreateTable
CREATE TABLE `UserWallet` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userCoin` INTEGER NOT NULL DEFAULT 0,
    `userMoney` INTEGER NOT NULL DEFAULT 0,
    `updateAt` DATETIME(3) NOT NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CoinExchange` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userWalletId` INTEGER NOT NULL,
    `exchangeRateId` INTEGER NOT NULL,
    `paymentId` INTEGER NOT NULL,

    UNIQUE INDEX `CoinExchange_userWalletId_key`(`userWalletId`),
    UNIQUE INDEX `CoinExchange_exchangeRateId_key`(`exchangeRateId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ExchangeRate` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bath` INTEGER NOT NULL,
    `coin` INTEGER NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `exchangeUpdateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Payment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `paymentImage` VARCHAR(191) NOT NULL,
    `userPaymentNumber` ENUM('ALREADY', 'CHECKING') NOT NULL,
    `BankName` VARCHAR(191) NOT NULL,
    `BankNumber` INTEGER NOT NULL,
    `updateAccout` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserWallet` ADD CONSTRAINT `UserWallet_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoinExchange` ADD CONSTRAINT `CoinExchange_userWalletId_fkey` FOREIGN KEY (`userWalletId`) REFERENCES `UserWallet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoinExchange` ADD CONSTRAINT `CoinExchange_exchangeRateId_fkey` FOREIGN KEY (`exchangeRateId`) REFERENCES `ExchangeRate`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoinExchange` ADD CONSTRAINT `CoinExchange_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `Payment`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
