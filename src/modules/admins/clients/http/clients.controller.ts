import { Controller, Get } from "@nestjs/common";


@Controller("/admin/clients")
export class ClientsController {
  constructor() {}


  @Get("/")
  async getClients(): Promise<any> {

  }
}