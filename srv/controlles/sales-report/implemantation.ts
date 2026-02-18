import { ExpectedResult } from "@models/db/types/SalesReportByDays";
import { salesReportController } from "./protocols";
import { SalesReportService } from "@/services/sales-report/protocols";

export class SalesReportControllerImpl implements salesReportController {
    constructor(private readonly service: SalesReportService){}

    findBydays(days: number): Promise<ExpectedResult[]> {
        return this.service.findBydays(days);
    }
}