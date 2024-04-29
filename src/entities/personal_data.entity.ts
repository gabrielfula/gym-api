import { GENDER, Personal_data } from "@prisma/client";

class PersonalDataEntity implements Personal_data {
  id:            number;
  uuid:          string;
  name:          string;
  rg_document:   string;
  cpf:           string;
  email:         string;
  phone:         string;
  date_of_birth: Date;
  address_id:    number;
  employee_id:   number;
  gender:        GENDER;
  created_at:    Date;
  updated_at:    Date;
  deleted_at:    Date;
}

export { PersonalDataEntity }