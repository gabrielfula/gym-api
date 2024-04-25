import { GENDER, personal_data } from "@prisma/client";

class PersonalDataEntity implements personal_data {
  id:          number;
  uuid:        string;
  name:        string;
  rg_document: string;
  cpf:         string;
  email:       string;
  phone:       string;
  gender:      GENDER;
  created_at:  Date;
  updated_at:  Date;
  deleted_at:  Date;
}

export { PersonalDataEntity }