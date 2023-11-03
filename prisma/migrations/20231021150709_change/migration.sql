/*
  Warnings:

  - You are about to drop the column `writeName` on the `mangawriter` table. All the data in the column will be lost.
  - Added the required column `mangaWriterId` to the `Manga` table without a default value. This is not possible if the table is not empty.
  - Added the required column `writerName` to the `MangaWriter` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `manga` ADD COLUMN `mangaWriterId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `mangawriter` DROP COLUMN `writeName`,
    ADD COLUMN `writerName` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `Manga` ADD CONSTRAINT `Manga_mangaWriterId_fkey` FOREIGN KEY (`mangaWriterId`) REFERENCES `MangaWriter`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
