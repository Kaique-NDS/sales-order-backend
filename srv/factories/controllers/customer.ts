import { CustomerController } from 'srv/controlles/customer/protocols';
import { CustomerControllerImp } from 'srv/controlles/customer/implementation';
import { customerService } from '../service/customer';

const makeCustomerController = (): CustomerController => {
    return new CustomerControllerImp(customerService);
};

export const customerController = makeCustomerController();
