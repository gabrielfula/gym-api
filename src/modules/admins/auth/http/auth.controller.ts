import { Controller, Get, Post } from "@nestjs/common";

@Controller('admins')
export class AuthController {
  constructor() {}


  @Post('signin')
  async signin() {
    const data = 'teste';


    return data;
  }
}