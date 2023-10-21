/*
  Warnings:

  - A unique constraint covering the columns `[userId]` on the table `UserWallet` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `UserWallet_userId_key` ON `UserWallet`(`userId`);
