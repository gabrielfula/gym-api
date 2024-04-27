/*
  Warnings:

  - Added the required column `payment_date` to the `enrollments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date_of_birth` to the `personal_data` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `addresses_personal_data_id_fkey` ON `addresses`;

-- DropIndex
DROP INDEX `employees_personal_data_id_fkey` ON `employees`;

-- AlterTable
ALTER TABLE `enrollments` ADD COLUMN `payment_date` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `personal_data` ADD COLUMN `date_of_birth` DATETIME(3) NOT NULL;
