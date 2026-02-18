import { ExpectedResult as SalesReportByDays } from "@models/db/types/SalesReportByDays";

import { SalesReportService } from "./protocols";
import { SalesReportRepository } from "@/repositories/sales-report/protocols";

export class SalesReportServiceImpl implements SalesReportService {
    constructor(private repository: SalesReportRepository){}

    public async findBydays(days: 7): Promise<SalesReportByDays[]> {
        const reportData = await this.repository.findBydays(days);
        if(!reportData){
            return []
        }
        return reportData?.map((r) => r.toObject());
    }

    public async findByCustomerId(customerId: string): Promise<SalesReportByDays[]> {
        const reportData = await this.repository.findByCustomer(customerId);
        if(!reportData){
            return []
        }
        return reportData?.map((r) => r.toObject());
    }
}