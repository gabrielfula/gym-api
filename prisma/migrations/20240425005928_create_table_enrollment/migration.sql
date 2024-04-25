/*
  Warnings:

  - Added the required column `updated_at` to the `addresses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `enrollment_id` to the `clients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `employees` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payment_method` to the `payments` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `addresses` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `clients` ADD COLUMN `enrollment_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `employees` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `payments` ADD COLUMN `payment_method` ENUM('CREDIT_CARD', 'PIX', 'DEBIT_CARD', 'MONEY') NOT NULL;

-- CreateTable
CREATE TABLE `enrollments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(80) NOT NULL,
    `status` ENUM('ACTIVE', 'CANCELLED') NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    UNIQUE INDEX `enrollments_uuid_key`(`uuid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `clients` ADD CONSTRAINT `clients_enrollment_id_fkey` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
