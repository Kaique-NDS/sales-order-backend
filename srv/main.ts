import cds, { Request, Service } from '@sap/cds';
import { Customers }  from '@models/sales'

// função que apos o "Customers" ser lido e se o "Costumer" não tiver @ no email, sera adicionado @gmail.com
export default (service: Service) => {
    service.after('READ', 'Customers', (results: Customers) => {
        results.forEach(Customer => {
            if(!Customer.email?.includes('@')){
                Customer.email = `${Customer.email}@gmail.com`;
            }

        })
    });

    service.before('CREATE', 'SalesOrderHeader', async (request: Request) => { 
        const params = request.data;

        
        if (!params.customer_id){
            return request.reject(400, 'Customers invalido');
        }

        
        if(!params.itens || params.itens.length === 0){
            return request.reject(404, 'Item Invalido')
        }
        

        const CustomerQuery = SELECT.one.from('sales.Customers').where({id: params.customer_id})
        const customer = await cds.run(CustomerQuery) // pesquisar sobre o await
       
        if(!customer){
            return request.reject(404, 'Customer não encontrado');
        }
    })
}