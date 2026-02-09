import { CustomerModel, CustomerProps } from '@/models/customers';

export interface CustomerRepository {
    findById(id: CustomerProps['id']): Promise<CustomerModel | null>;
}
