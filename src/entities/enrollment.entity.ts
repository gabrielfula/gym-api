import { STATUS_ENROLLMENTS, enrollment } from "@prisma/client";

class EnrollmentEntity implements enrollment {
  id: number;
  uuid: string;
  status: STATUS_ENROLLMENTS;
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
}

export { EnrollmentEntity }