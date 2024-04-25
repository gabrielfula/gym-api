/*
  Warnings:

  - A unique constraint covering the columns `[rg_document]` on the table `personal_data` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cpf]` on the table `personal_data` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `cpf` to the `personal_data` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `personal_data` ADD COLUMN `cpf` VARCHAR(11) NOT NULL;

-- CreateTable
CREATE TABLE `clients` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(80) NOT NULL,
    `personal_data_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,
    `payment_id` INTEGER NULL,

    UNIQUE INDEX `clients_uuid_key`(`uuid`),
    UNIQUE INDEX `clients_personal_data_id_key`(`personal_data_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(80) NOT NULL,
    `status` ENUM('PAID', 'EXPIRED', 'CANCELLED', 'AWAITING_PAYMENT') NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    UNIQUE INDEX `payments_uuid_key`(`uuid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `employees` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(80) NOT NULL,
    `office` ENUM('PERSONAL_TRAINER', 'CLEANER') NOT NULL,
    `personal_data_id` INTEGER NOT NULL,

    UNIQUE INDEX `employees_uuid_key`(`uuid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `addresses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(80) NOT NULL,
    `zipcode` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `number` VARCHAR(191) NULL,
    `city` VARCHAR(191) NOT NULL,
    `complement` VARCHAR(191) NOT NULL,
    `neighborhood` VARCHAR(191) NOT NULL,
    `personal_data_id` INTEGER NULL,

    UNIQUE INDEX `addresses_uuid_key`(`uuid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `personal_data_rg_document_key` ON `personal_data`(`rg_document`);

-- CreateIndex
CREATE UNIQUE INDEX `personal_data_cpf_key` ON `personal_data`(`cpf`);

-- AddForeignKey
ALTER TABLE `clients` ADD CONSTRAINT `clients_personal_data_id_fkey` FOREIGN KEY (`personal_data_id`) REFERENCES `personal_data`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `clients` ADD CONSTRAINT `clients_payment_id_fkey` FOREIGN KEY (`payment_id`) REFERENCES `payments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `employees` ADD CONSTRAINT `employees_personal_data_id_fkey` FOREIGN KEY (`personal_data_id`) REFERENCES `personal_data`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `addresses` ADD CONSTRAINT `addresses_personal_data_id_fkey` FOREIGN KEY (`personal_data_id`) REFERENCES `personal_data`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
