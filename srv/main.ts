import { foreach, Service } from '@sap/cds';
import { Customer, Customers }  from '@models/sales'

// função que apos o "Customers" ser lido e se o "Costumer" não tiver @ no email, sera adicionado @gmail.com
export default (service: Service) => {
    service.after('READ', 'Customers', (results: Customers) => {
        results.forEach(Customer => {
            if(!Customer.email?.includes('@')){
                Customer.email = `${Customer}@gmail.com`;
            }

        })
    })
}