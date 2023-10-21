/*
  Warnings:

  - You are about to drop the column `image` on the `manga` table. All the data in the column will be lost.
  - You are about to drop the column `page` on the `manga` table. All the data in the column will be lost.
  - Added the required column `mangaPage` to the `Manga` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `manga` DROP COLUMN `image`,
    DROP COLUMN `page`,
    ADD COLUMN `imageCover` VARCHAR(191) NULL,
    ADD COLUMN `mangaPage` VARCHAR(191) NOT NULL;
