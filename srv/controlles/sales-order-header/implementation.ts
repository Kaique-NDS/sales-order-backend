import { User } from '@sap/cds';

import { SalesOrderHeaderController } from '@/controlles/sales-order-header/protocols' 
import { SalesOrderHeaderModel } from '@/models/sales-order-header';
import { CreationPayloadValidationResult, SalesOrderHeaderService } from '@/services/sales-order-header/protocols';

export class SalesOrderControllerImpl implements SalesOrderHeaderController {
    constructor(private readonly service: SalesOrderHeaderService) {}

    public async beforeCreate(params: SalesOrderHeaderModel): Promise<CreationPayloadValidationResult> {
        return this.service.beforeCreate(params);
    }

    public async afterCreate(params: SalesOrderHeaderModel, loggedUser: User): Promise<void> {
        return this.service.afterCreate(params, loggedUser);
    }
}
