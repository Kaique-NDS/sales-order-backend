using { MyService } from '../routes/main';

annotate MyService.SalesOrderHeaders with @(
    Capabilities: {
        DeleteRestrictions : {
            $Type : 'Capabilities.DeleteRestrictionsType',
            Deletable: false,
        },
        FilterRestrictions : {
            $Type : 'Capabilities.FilterRestrictionsType',
            FilterExpressionRestrictions: [
                {
                    Property: createdAt,
                    AllowedExpressions: 'SingleRange'
                },
                {
                    Property: modifiedAt,
                    AllowedExpressions: 'SingleRange'
                }
            ]
        },
    },
    UI: {
      SelectionFields : [
        id,
        totalAmount,
        customer_id,
        createdAt,
        modifiedAt,
        status_id
      ],
        LineItem: [
            {
              $Type:'UI.DataField',
              Value: id,
              ![@HTML5.CssDefaults] : {
                 $Type: 'HTML5.CssDefaultsType',
                 width: '20rem',
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
                 width: '15rem',
               }
            },
            {
              $Type:'UI.DataField',
              Value: createdBy,
              ![@HTML5.CssDefaults] : {
                 $Type: 'HTML5.CssDefaultsType',
                 width: '15rem',
               }
            }
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Pedido',
            TypeNamePlural : 'Pedidos',
            Title : {
                $Type : 'UI.DataField',
                Value : 'Numero do Pedido: {id}',
            },
        },
        Facets  : [
            {
              ID: 'SalesOrderData',
              $Type: 'UI.CollectionFacet',
              Label: 'Informações do Pedido',
              Facets: [
                {
                  ID: 'Header',
                  $Type: 'UI.ReferenceFacet',
                  Target: '@UI.FieldGroup#Header',
                }
              ]
            },
            {
              ID: 'CustomerData',
              $Type: 'UI.ReferenceFacet',
              Label: 'Informações do Cliente',
              Target: 'customer/@UI.FieldGroup#CustomerData',
            },
            {
              ID: 'itemsData',
              $Type: 'UI.ReferenceFacet',
              Label: 'Itens do Pedido',
              Target: 'items/@UI.LineItem',
            },
        ],
        FieldGroup#Header : {
    $Type: 'UI.FieldGroupType',
    Data: [
        {
            $Type: 'UI.DataField',
            Value: id,
        },
        {
            $Type: 'UI.DataField',
            Value: totalAmount,
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Criado Por',
            Value: createdBy,
        },
        ]
}
},

) {
  id @title : 'ID';
  createdAt @title : 'Data de Criação';
  totalAmount @title : 'Valor Total';
  modifiedAt @title : 'Data de Modificação';
  createdBy @title : 'Criado Por';
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

annotate MyService.Customers with @(
  UI: {
    FieldGroup#CustomerData : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : id,
            },
            {
                $Type : 'UI.DataField',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Value : email,
            },
        ]
    },
  }
){
  id @title : 'ID';
  firstName @title : 'Primeiro Nome';
  lastName @title : 'Sobrenome';
  email @title : 'E-mail';
};

annotate MyService.SalesOrderItems with @(
  UI: {
    LineItem : [
        {
            $Type: 'UI.DataField',
            Value: id,
            ![@HTML5.CssDefaults] : {
                 $Type: 'HTML5.CssDefaultsType',
                 width: '19rem',
               }
        },
        {
            $Type: 'UI.DataField',
            Label: 'Produto',
            Value: product.nome,
            ![@HTML5.CssDefaults] : {
                 $Type: 'HTML5.CssDefaultsType',
                 width: '9rem',
               }
        },
        {
            $Type: 'UI.DataField',
            Value: quantity,
        },
        {
            $Type: 'UI.DataField',
            Value: price,
        },
    ],
  }
){
  id @title : 'ID';
  quantity @title : 'Quantidade';
  price @title: 'Preço';
  product @title: 'Produto';
  header @UI.Hidden @UI.HiddenFilter;
  product @UI.Hidden @UI.HiddenFilter;
};