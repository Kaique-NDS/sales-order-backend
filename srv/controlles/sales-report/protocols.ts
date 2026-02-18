import { ExpectedResult as SalesReportByDays} from "@models/db/types/SalesReportByDays";


export interface salesReportController {
     findBydays(days: number): Promise<SalesReportByDays[]>;
}