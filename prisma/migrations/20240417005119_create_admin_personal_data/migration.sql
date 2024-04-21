-- CreateTable
CREATE TABLE `admins` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(80) NOT NULL,
    `username` VARCHAR(80) NOT NULL,
    `password` VARCHAR(80) NOT NULL,
    `personal_data_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    UNIQUE INDEX `admins_uuid_key`(`uuid`),
    UNIQUE INDEX `admins_personal_data_id_key`(`personal_data_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `personal_data` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(80) NOT NULL,
    `name` VARCHAR(80) NOT NULL,
    `rg_document` VARCHAR(11) NOT NULL,
    `email` VARCHAR(80) NOT NULL,
    `phone` VARCHAR(11) NOT NULL,
    `gender` ENUM('M', 'F', 'NB') NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    UNIQUE INDEX `personal_data_uuid_key`(`uuid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `admins` ADD CONSTRAINT `admins_personal_data_id_fkey` FOREIGN KEY (`personal_data_id`) REFERENCES `personal_data`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
