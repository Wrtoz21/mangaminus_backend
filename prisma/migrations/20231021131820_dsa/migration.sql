/*
  Warnings:

  - You are about to drop the column `mangaWriterId` on the `manga` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `Manga_mangaWriterId_fkey` ON `manga`;

-- AlterTable
ALTER TABLE `manga` DROP COLUMN `mangaWriterId`;
