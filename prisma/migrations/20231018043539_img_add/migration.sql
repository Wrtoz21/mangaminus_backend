/*
  Warnings:

  - Added the required column `page` to the `Manga` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `manga` ADD COLUMN `image` VARCHAR(191) NULL,
    ADD COLUMN `page` INTEGER NOT NULL;
