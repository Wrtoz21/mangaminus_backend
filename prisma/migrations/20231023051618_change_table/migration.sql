/*
  Warnings:

  - You are about to drop the column `mangaId` on the `purchasedbyuser` table. All the data in the column will be lost.
  - You are about to drop the `manga` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `purchasedbyuser` DROP FOREIGN KEY `PurchasedByUser_mangaId_fkey`;

-- AlterTable
ALTER TABLE `purchasedbyuser` DROP COLUMN `mangaId`;

-- DropTable
DROP TABLE `manga`;

-- CreateTable
CREATE TABLE `Writer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `writerName` VARCHAR(191) NOT NULL,
    `mangaNameNCoverId` INTEGER NOT NULL,

    UNIQUE INDEX `Writer_writerName_key`(`writerName`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MangaNameNCover` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mangaName` VARCHAR(191) NOT NULL,
    `mangaCover` VARCHAR(191) NOT NULL,
    `detail` VARCHAR(191) NOT NULL,
    `mangaEpisodeId` INTEGER NULL,

    UNIQUE INDEX `MangaNameNCover_mangaName_key`(`mangaName`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MangaEpisode` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mangaSrc` VARCHAR(191) NOT NULL,
    `page` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Writer` ADD CONSTRAINT `Writer_mangaNameNCoverId_fkey` FOREIGN KEY (`mangaNameNCoverId`) REFERENCES `MangaNameNCover`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MangaNameNCover` ADD CONSTRAINT `MangaNameNCover_mangaEpisodeId_fkey` FOREIGN KEY (`mangaEpisodeId`) REFERENCES `MangaEpisode`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
