/*
  Warnings:

  - Made the column `payment_id` on table `clients` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `addresses` DROP FOREIGN KEY `addresses_personal_data_id_fkey`;

-- DropForeignKey
ALTER TABLE `clients` DROP FOREIGN KEY `clients_payment_id_fkey`;

-- DropForeignKey
ALTER TABLE `employees` DROP FOREIGN KEY `employees_personal_data_id_fkey`;

-- AlterTable
ALTER TABLE `clients` MODIFY `payment_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `personal_data` ADD COLUMN `address_id` INTEGER NULL,
    ADD COLUMN `employee_id` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `personal_data` ADD CONSTRAINT `personal_data_address_id_fkey` FOREIGN KEY (`address_id`) REFERENCES `addresses`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `personal_data` ADD CONSTRAINT `personal_data_employee_id_fkey` FOREIGN KEY (`employee_id`) REFERENCES `employees`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `clients` ADD CONSTRAINT `clients_payment_id_fkey` FOREIGN KEY (`payment_id`) REFERENCES `payments`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
