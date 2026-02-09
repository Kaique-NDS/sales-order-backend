import { SalesOrderControllerImpl } from '@/controlles/sales-order-header/implementation';
import { SalesOrderHeaderController } from '@/controlles/sales-order-header/protocols';
import { salesOrderHeaderService } from '@/factories/service/sales-order-header';

export const makeSalesOrderHeaderController = (): SalesOrderHeaderController => {
    return new SalesOrderControllerImpl(salesOrderHeaderService);
};

export const salesOrderHeaderController = makeSalesOrderHeaderController();
