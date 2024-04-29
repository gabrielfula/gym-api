import { Client } from "@prisma/client";

class ClientEntity implements Client {
  id: number;
  uuid: string;
  personal_data_id: number;
  payment_id: number;
  enrollment_id: number;
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
}

export { ClientEntity }