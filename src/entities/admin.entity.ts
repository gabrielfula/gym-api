import { admin } from '@prisma/client';

class AdminEntity implements admin {
  id: number;
  uuid: string;
  username: string;
  password: string;
  personal_data_id: number;
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
}

export { AdminEntity };