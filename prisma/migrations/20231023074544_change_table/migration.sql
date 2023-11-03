/*
  Warnings:

  - You are about to drop the column `mangaEpisodeId` on the `manganamencover` table. All the data in the column will be lost.
  - Added the required column `mangaNameNCoverId` to the `MangaEpisode` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `manganamencover` DROP FOREIGN KEY `MangaNameNCover_mangaEpisodeId_fkey`;

-- AlterTable
ALTER TABLE `mangaepisode` ADD COLUMN `mangaNameNCoverId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `manganamencover` DROP COLUMN `mangaEpisodeId`;

-- AddForeignKey
ALTER TABLE `MangaEpisode` ADD CONSTRAINT `MangaEpisode_mangaNameNCoverId_fkey` FOREIGN KEY (`mangaNameNCoverId`) REFERENCES `MangaNameNCover`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
