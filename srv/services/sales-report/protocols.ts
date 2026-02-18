import { ExpectedResult as SalesReportByDays} from "@models/db/types/SalesReportByDays";

export interface SalesReportService {
    findBydays(days: number): Promise<SalesReportByDays[]>;
}