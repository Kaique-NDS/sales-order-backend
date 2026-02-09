import { Customers } from '@models/sales';

// Responsável por orquestrar as requisições do controller com o serviço.
import { CustomerController } from '@/controlles/customer/protocols';
import { CustomerService } from '@/services/customer/protocols';

// Controller que gerencia as operações de customer
export class CustomerControllerImp implements CustomerController {
    // Injeta o serviço de customer como dependência
    constructor(private readonly service: CustomerService) {}

    // Método executado após leitura de customers, delegando ao serviço
    public afterRead(customerList: Customers): Customers {
        return this.service.afterread(customerList);
    }
}
