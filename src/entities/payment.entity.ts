import { STATUS_PAYMENT, payment, PAYMENT_METHOD } from "@prisma/client";

class PaymentEntity implements payment {
  id: number;
  uuid: string;
  status: STATUS_PAYMENT;
  payment_method: PAYMENT_METHOD;
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
}

export { PaymentEntity }