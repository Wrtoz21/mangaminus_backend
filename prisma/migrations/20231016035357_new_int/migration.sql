/*
  Warnings:

  - You are about to alter the column `bath` on the `exchangerate` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `coin` on the `exchangerate` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.

*/
-- AlterTable
ALTER TABLE `exchangerate` MODIFY `bath` INTEGER NOT NULL,
    MODIFY `coin` INTEGER NOT NULL;
