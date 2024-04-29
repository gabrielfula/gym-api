import { Address } from "@prisma/client";

class AddressEntity implements Address {
  id: number;
  uuid: string;
  zipcode: string;
  address: string;
  number: string | null;
  city: string;
  complement: string;
  neighborhood: string;
  personal_data_id: number;
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
}

export { AddressEntity };