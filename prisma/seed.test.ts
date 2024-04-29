import { GENDER, OFFICES, PAYMENT_METHOD, PrismaClient, STATUS_ENROLLMENTS, STATUS_PAYMENT } from "@prisma/client";
import { randomUUID } from "crypto";

const prisma = new PrismaClient()

async function main() {

  const personal_datas = await prisma.personal_data.createMany({
    data: [
      {
        uuid: randomUUID(),
        name: "Carlos Oliveira",
        rg_document: "13972584020",
        cpf: "95730821685",
        date_of_birth: new Date('2005-06-01'),
        email: "carlos@example.com",
        phone: "5555555555",
        gender: GENDER.M,
      },
      {
        uuid: randomUUID(),
        name: "João Silva",
        rg_document: "92468031751",
        cpf: "61037849263",
        date_of_birth: new Date('2002-08-09'),
        email: "joao@example.com",
        phone: "5551234567",
        gender: GENDER.M,
      },
      {
        uuid: randomUUID(),
        name: "Alex Pedro",
        rg_document: "72649103852",
        cpf: "14250396780",
        date_of_birth: new Date('1990-04-29'),
        email: "Alex@example.com",
        phone: "5551234567",
        gender: GENDER.NB,
      },
      {
        uuid: randomUUID(),
        name: "Maria Souza",
        rg_document: "51327084936",
        cpf: "83502916470",
        date_of_birth: new Date('1975-02-25'),
        email: "maria@example.com",
        phone: "5559876543",
        gender: GENDER.F,
      },
      {
        uuid: randomUUID(),
        name: "Ana Santos",
        rg_document: "70936251480",
        cpf: "21789053641",
        date_of_birth: new Date('2004-01-10'),
        email: "ana@example.com",
        phone: "5559999999",
        gender: GENDER.F,
      },
      {
        uuid: randomUUID(),
        name: "Fernanda Oliveira",
        rg_document: "63104728915",
        cpf: "59014327836",
        date_of_birth: new Date('1980-12-19'),
        email: "fernanda@example.com",
        phone: "5552222222",
        gender: GENDER.F,
      },
      {
        uuid: randomUUID(),
        name: "Pedro Santos",
        rg_document: "47031895264",
        cpf: "86409275310",
        date_of_birth: new Date('1975-05-25'),
        email: "pedro@example.com",
        phone: "5553333333",
        gender: "M"
      },
      {
        uuid: randomUUID(),
        name: "Camila Silva",
        rg_document: "92507314863",
        cpf: "73590146280",
        date_of_birth: new Date('1990-08-15'),
        email: "camila@example.com",
        phone: "5554444444",
        gender: "F"
      },
      {
        uuid: randomUUID(),
        name: "Rafael Oliveira",
        rg_document: "20875391642",
        cpf: "37604259180",
        date_of_birth: new Date('1988-03-10'),
        email: "rafael@example.com",
        phone: "5555555555",
        gender: "M"
      },
      {
        uuid: randomUUID(),
        name: "Juliana Costa",
        rg_document: "61938205743",
        cpf: "58104792360",
        date_of_birth: new Date('1985-09-08'),
        email: "juliana@example.com",
        phone: "5556666666",
        gender: "F"
      }
    ]
  })

  const payments = await prisma.payment.createMany({
    data: [
      {
        uuid: randomUUID(),
        status: STATUS_PAYMENT.PAID,
        price: 100,
        payment_method: PAYMENT_METHOD.PIX
      },
      {
        uuid: randomUUID(),
        status: STATUS_PAYMENT.PAID,
        price: 45.00,
        payment_method: PAYMENT_METHOD.CREDIT_CARD
      },
      {
        uuid: randomUUID(),
        status: STATUS_PAYMENT.PAID,
        price: 250.90,
        payment_method: PAYMENT_METHOD.DEBIT_CARD
      },
      {
        uuid: randomUUID(),
        status: STATUS_PAYMENT.PAID,
        price: 120.90,
        payment_method: PAYMENT_METHOD.CREDIT_CARD
      },
      {
        uuid: randomUUID(),
        status: STATUS_PAYMENT.PAID,
        price: 99.90,
        payment_method: PAYMENT_METHOD.DEBIT_CARD
      },
      {
        uuid: randomUUID(),
        status: STATUS_PAYMENT.PAID,
        price: 78.00,
        payment_method: PAYMENT_METHOD.MONEY
      },
    ]
  })

  const enrollments = await prisma.enrollment.createMany({
    data: [
      {
        uuid: randomUUID(),
        payment_date: new Date('2024-04-24'),
        status: STATUS_ENROLLMENTS.ACTIVE,
        payment_id: 1,
      },
      {
        uuid: randomUUID(),
        // payment_date: new Date('2024-04-24'),
        status: STATUS_ENROLLMENTS.CANCELLED,
        payment_id: 2,
      },
      {
        uuid: randomUUID(),
        // payment_date: new Date('2024-04-24'),
        status: STATUS_ENROLLMENTS.CANCELLED,
        payment_id: 3,
      },
      {
        uuid: randomUUID(),
        payment_date: new Date('2023-01-12'),
        status: STATUS_ENROLLMENTS.ACTIVE,
        payment_id: 4,
      },
      {
        uuid: randomUUID(),
        payment_date: new Date('2023-05-03'),
        status: STATUS_ENROLLMENTS.ACTIVE,
        payment_id: 5,
      },
      {
        uuid: randomUUID(),
        payment_date: new Date('2023-12-27'),
        status: STATUS_ENROLLMENTS.ACTIVE,
        payment_id: 6,
      },
    ]
  })

  const client = await prisma.client.createMany({
    data: [
      {
        uuid: randomUUID(),
        personal_data_id: 12,
        enrollment_id: 1,
        payment_id: 1,
      },
      {
        uuid: randomUUID(),
        personal_data_id: 13,
        enrollment_id: 2,
        payment_id: 2,
      },
      {
        uuid: randomUUID(),
        personal_data_id: 14,
        enrollment_id: 3,
        payment_id: 3,
      },
      {
        uuid: randomUUID(),
        personal_data_id: 15,
        enrollment_id: 4,
        payment_id: 4,
      },
      {
        uuid: randomUUID(),
        personal_data_id: 17,
        enrollment_id: 5,
        payment_id: 5,
      },
      {
        uuid: randomUUID(),
        personal_data_id: 18,
        enrollment_id: 6,
        payment_id: 6,
      }
    ]
  })

  const employee = await prisma.employee.createMany({
    data: [
      {
        uuid: randomUUID(), 
        office: OFFICES.CLEANER,
        personal_data_id: 11,
      },
      {
        uuid: randomUUID(), 
        office: OFFICES.PERSONAL_TRAINER,
        personal_data_id: 16,
      },
      {
        uuid: randomUUID(), 
        office: OFFICES.TEACHERS,
        personal_data_id: 19,
      },
      {
        uuid: randomUUID(), 
        office: OFFICES.TRAINEE,
        personal_data_id: 20,
      },
    ]
  })

}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async e => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });