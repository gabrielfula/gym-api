/*
  Warnings:

  - Added the required column `price` to the `payments` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `payments` ADD COLUMN `price` DECIMAL(4, 2) NOT NULL;

-- CreateTable
CREATE TABLE `modalities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(80) NOT NULL,
    `name` ENUM('ZUMBA', 'MUSCULACAO', 'NATACAO', 'SPINNING') NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    UNIQUE INDEX `modalities_uuid_key`(`uuid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_EnrollmentToModality` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_EnrollmentToModality_AB_unique`(`A`, `B`),
    INDEX `_EnrollmentToModality_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_EnrollmentToModality` ADD CONSTRAINT `_EnrollmentToModality_A_fkey` FOREIGN KEY (`A`) REFERENCES `enrollments`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EnrollmentToModality` ADD CONSTRAINT `_EnrollmentToModality_B_fkey` FOREIGN KEY (`B`) REFERENCES `modalities`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
