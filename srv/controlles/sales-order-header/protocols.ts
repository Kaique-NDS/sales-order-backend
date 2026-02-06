import { CreationPayloadValidationResult } from 'srv/services/sales-order-header/protocols';
import { SalesOrderHeaderModel } from 'srv/models/sales-order-header';
import { User } from '@sap/cds';

export interface SalesOrderHeaderController {
    beforeCreate(params: SalesOrderHeaderModel): Promise<CreationPayloadValidationResult>;
    afterCreate(params: SalesOrderHeaderModel, loggedUser: User): Promise<void>;
}
