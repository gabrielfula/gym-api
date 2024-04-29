/*
  Warnings:

  - You are about to alter the column `price` on the `payments` table. The data in that column could be lost. The data in that column will be cast from `Decimal(4,2)` to `Decimal(10,2)`.

*/
-- AlterTable
ALTER TABLE `payments` MODIFY `price` DECIMAL(10, 2) NOT NULL;
