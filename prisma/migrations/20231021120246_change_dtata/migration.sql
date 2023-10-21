/*
  Warnings:

  - You are about to drop the column `imageCover` on the `manga` table. All the data in the column will be lost.
  - Added the required column `mangaWriterId` to the `Manga` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `manga` DROP COLUMN `imageCover`,
    ADD COLUMN `mangaWriterId` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `MangaWriter` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `writeName` VARCHAR(191) NOT NULL,
    `imageCover` VARCHAR(191) NULL,
    `detail` VARCHAR(191) NOT NULL,
    `updateAt` DATETIME(3) NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Manga` ADD CONSTRAINT `Manga_mangaWriterId_fkey` FOREIGN KEY (`mangaWriterId`) REFERENCES `MangaWriter`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
