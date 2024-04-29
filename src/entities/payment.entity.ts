import { STATUS_PAYMENT, Payment, PAYMENT_METHOD } from "@prisma/client";
import { Decimal } from "@prisma/client/runtime/library";

class PaymentEntity implements Payment {
  id: number;
  uuid: string;
  status: STATUS_PAYMENT;
  price: Decimal;
  payment_method: PAYMENT_METHOD;
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
}

export { PaymentEntity }