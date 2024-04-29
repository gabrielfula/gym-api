import { OFFICES, Employee } from "@prisma/client";

class EmployeeEntity implements Employee {
  id: number;
  uuid: string;
  office: OFFICES;
  personal_data_id: number;
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
}

export { EmployeeEntity }