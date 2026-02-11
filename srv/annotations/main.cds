using { MyService } from '../routes/main';

annotate MyService.SalesOrderHeaders with @(
    UI: {
      SelectionFields : [
        id,
        totalAmount,
        customer_id,
        createdAt,
        status_id
      ],
        LineItem: [
            {
              $Type:'UI.DataField',
              Value: id,
              ![@HTML5.CssDefaults] : {
                 $Type: 'HTML5.CssDefaultsType',
                 width: '10rem',
               }
            },
            {
              $Type:'UI.DataField',
              Label: 'Cliente',
              Value: customer.id,
              ![@HTML5.CssDefaults] : {
                 $Type: 'HTML5.CssDefaultsType',
                 width: '18rem',
               }
            },
             {
              $Type:'UI.DataField',
              Label: 'Status',
              Value: status.id,
              Criticality: (status.id = 'COMPLETED' ? 3 : (status.id = 'PENDING' ? 2 : 1)),
              ![@HTML5.CssDefaults] : {
                 $Type: 'HTML5.CssDefaultsType',
                 width: '7rem',
               }
            },
            {
              $Type:'UI.DataField',
              Value: totalAmount,
              ![@HTML5.CssDefaults] : {
                 $Type: 'HTML5.CssDefaultsType',
                 width: '18rem',
               }
            },
            {
              $Type:'UI.DataField',
              Value: createdAt,
              ![@HTML5.CssDefaults] : {
                 $Type: 'HTML5.CssDefaultsType',
                 width: '10rem',
               }
            }
        ],
    }
){
  id @title : 'ID';
  createdAt @title : 'Data de Criação';
  totalAmount @title : 'Valor Total';
  modifiedAt @title : 'Data de Modificação';
  customer @(
    title: 'Cliente',
    Common : {
      Label: 'Cliente',
      ValueList: {
          $Type: 'Common.ValueListType',
          CollectionPath: 'Customers',
          Parameters: [
            {
              $Type: 'Common.ValueListParameterInOut',
              ValueListProperty: 'id',
              LocalDataProperty: 'customer_id',
            },
            {
              $Type : 'Common.ValueListParameterDisplayOnly',
              ValueListProperty: 'firstName',
            },
             {
              $Type : 'Common.ValueListParameterDisplayOnly',
              ValueListProperty: 'lastName',
            },
             {
              $Type : 'Common.ValueListParameterDisplayOnly',
              ValueListProperty: 'email',
            },
          ]
      },
    }
  );
  status @(
    title: 'Status',
    Common : {
      Label: 'Status',
      Text : status.description,
      TextArrangement : #TextOnly,
      ValueListWithFixedValues,
      ValueList: {
          $Type: 'Common.ValueListType',
          CollectionPath: 'SalesOrderStatuses',
          Parameters: [
            {
              $Type: 'Common.ValueListParameterInOut',
              ValueListProperty: 'id',
              LocalDataProperty: 'status_id',
            },
          ]
      },
    }
  );
};

annotate MyService.SalesOrderStatuses with {
  id @Common.Text: description @Common.TextArrangement: #TextOnly;
};

