import { STATUS_ENROLLMENTS, Enrollment } from "@prisma/client";

class EnrollmentEntity implements Enrollment {
  id:           number;
  uuid:         string;
  payment_id:   number;
  payment_date: Date;
  status:       STATUS_ENROLLMENTS;
  created_at:   Date;
  updated_at:   Date;
  deleted_at:   Date;
}

export { EnrollmentEntity }