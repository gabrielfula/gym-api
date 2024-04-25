import { Module } from '@nestjs/common';

import { AuthController } from './auth/auth.controller';


@Module({
  controllers: [AuthController],
  providers: [],
})
export class AdminsModule {}
