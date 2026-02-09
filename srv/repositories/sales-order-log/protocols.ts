import { SalesOrderLogsModel } from '@/models/sales-order-logs';

export interface SalesOrderLogRepository {
    create(logs: SalesOrderLogsModel[]): Promise<void>;
}
