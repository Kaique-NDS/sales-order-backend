// Responsável por orquestrar as requisições do controller com o serviço.
import { CustomerController } from './protocols';
import { CustomerService } from 'srv/services/customer/protocols';
import { Customers } from '@models/sales';

// Controller que gerencia as operações de customer
export class CustomerControllerImp implements CustomerController {
    // Injeta o serviço de customer como dependência
    constructor(private readonly service: CustomerService) {}

    // Método executado após leitura de customers, delegando ao serviço
    public afterRead(customerList: Customers): Customers {
        return this.service.afterread(customerList);
    }
}
