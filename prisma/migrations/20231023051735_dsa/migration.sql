/*
  Warnings:

  - Added the required column `episode` to the `MangaEpisode` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `mangaepisode` ADD COLUMN `episode` INTEGER NOT NULL;
