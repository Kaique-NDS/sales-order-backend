using { sales } from '../schema';
 
namespace db.types.SalesReportByDays;
 
  type ExpectedResult {
      SalesOrderId: sales.SalesOrderHeaders : id;
      SalesOrderHeaderTotalAmount: sales.SalesOrderHeaders : totalAmount;
      customerId: sales.Customers : id;
      customerFullName: String(120);
  };
  
  type Params {
      days: Integer;
  }
 
 