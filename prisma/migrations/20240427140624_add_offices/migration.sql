-- AlterTable
ALTER TABLE `employees` MODIFY `office` ENUM('PERSONAL_TRAINER', 'CLEANER', 'TRAINEE', 'TEACHERS') NOT NULL;

-- AlterTable
ALTER TABLE `payments` MODIFY `payment_method` ENUM('CREDIT_CARD', 'PIX', 'DEBIT_CARD', 'MONEY') NULL;
