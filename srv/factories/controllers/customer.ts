import { CustomerController } from '@/controlles/customer/protocols';
import { CustomerControllerImp } from '@/controlles/customer/implementation';
import { customerService } from '@/factories/service/customer';

const makeCustomerController = (): CustomerController => {
    return new CustomerControllerImp(customerService);
};

export const customerController = makeCustomerController();
