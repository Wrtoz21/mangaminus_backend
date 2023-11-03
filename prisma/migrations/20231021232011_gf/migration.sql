/*
  Warnings:

  - You are about to drop the column `mangaWriterId` on the `manga` table. All the data in the column will be lost.
  - You are about to drop the `mangawriter` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `manga` DROP FOREIGN KEY `Manga_mangaWriterId_fkey`;

-- AlterTable
ALTER TABLE `manga` DROP COLUMN `mangaWriterId`,
    ADD COLUMN `detail` VARCHAR(191) NULL,
    ADD COLUMN `episode` INTEGER NULL,
    ADD COLUMN `imageCover` VARCHAR(191) NULL,
    ADD COLUMN `writerName` VARCHAR(191) NULL,
    MODIFY `mangaPrice` INTEGER NULL,
    MODIFY `mangaPage` VARCHAR(191) NULL;

-- DropTable
DROP TABLE `mangawriter`;
