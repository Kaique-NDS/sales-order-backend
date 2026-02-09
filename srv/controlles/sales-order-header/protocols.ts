import { User } from '@sap/cds';

import { CreationPayloadValidationResult } from '@/services/sales-order-header/protocols';
import { SalesOrderHeaderModel } from '@/models/sales-order-header';

export interface SalesOrderHeaderController {
    beforeCreate(params: SalesOrderHeaderModel): Promise<CreationPayloadValidationResult>;
    afterCreate(params: SalesOrderHeaderModel, loggedUser: User): Promise<void>;
}
