-- AlterTable
ALTER TABLE `enrollments` ADD COLUMN `payment_id` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `enrollments` ADD CONSTRAINT `enrollments_payment_id_fkey` FOREIGN KEY (`payment_id`) REFERENCES `payments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
