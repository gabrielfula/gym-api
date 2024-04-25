import { OFFICES, employee } from "@prisma/client";

class EmployeeEntity implements employee {
  id: number;
  uuid: string;
  office: OFFICES;
  personal_data_id: number;
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
}

export { EmployeeEntity }