/*
  Warnings:

  - You are about to drop the column `mangaNameNCoverId` on the `writer` table. All the data in the column will be lost.
  - Added the required column `writerId` to the `MangaNameNCover` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `writer` DROP FOREIGN KEY `Writer_mangaNameNCoverId_fkey`;

-- AlterTable
ALTER TABLE `manganamencover` ADD COLUMN `writerId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `writer` DROP COLUMN `mangaNameNCoverId`;

-- AddForeignKey
ALTER TABLE `MangaNameNCover` ADD CONSTRAINT `MangaNameNCover_writerId_fkey` FOREIGN KEY (`writerId`) REFERENCES `Writer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
