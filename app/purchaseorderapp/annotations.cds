using { purchaseOrderManagementSrv } from '../../srv/service.cds';

annotate purchaseOrderManagementSrv.PurchaseOrders with {
  Supplier @Common.ValueList: {
    CollectionPath: 'Suppliers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Supplier_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'suppliersID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
    ],
  }
};
annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.DataPoint #quantity: {
  Value: quantity,
  Title: 'Quantity',
};
annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.DataPoint #status: {
  Value: status_code,
  Title: 'Status',
  Criticality: status.criticality,
};
annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#quantity', ID: 'Quantity' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price', ID: 'Price' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status', ID: 'Status' }
];
annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.HeaderInfo: {
  TypeName: 'Purchase Order',
  TypeNamePlural: 'Purchase Orders',
  Title: { Value: purchaseOrdersID }
};
annotate purchaseOrderManagementSrv.PurchaseOrders with {
  ID @UI.Hidden
};
annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.Identification: [{ Value: purchaseOrdersID }];
annotate purchaseOrderManagementSrv.PurchaseOrders with {
  purchaseOrdersID @Common.Label: 'ID';
  supplierName @Common.Label: 'Supplier Name';
  productName @Common.Label: 'Product Name';
  quantity @Common.Label: 'Quantity';
  price @Common.Label: 'Price';
  totalAmount @Common.Label: 'Total Amount';
  status @Common.Label: 'Status';
  createdAt @Common.Label: 'Created At';
  Supplier @Common.Label: 'Supplier'
};
annotate purchaseOrderManagementSrv.PurchaseOrders with {
  status @Common.Text : { $value: status.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate purchaseOrderManagementSrv.PurchaseOrders with {
  status @Common.ValueListWithFixedValues;
};
annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.SelectionFields : [
 supplierName,
 status_code
];
annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: purchaseOrdersID },
    { $Type: 'UI.DataField', Value: supplierName },
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: totalAmount },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality },
    { $Type: 'UI.DataField', Value: createdAt }
];
annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.FieldGroup #purchaseOrderDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: purchaseOrdersID },
    { $Type: 'UI.DataField', Value: supplierName },
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: totalAmount },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality },
    { $Type: 'UI.DataField', Value: createdAt }

  ]
};


annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.FieldGroup #supplierInformation: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Supplier.suppliersID },
    { $Type: 'UI.DataField', Value: Supplier.name },
    { $Type: 'UI.DataField', Value: Supplier.email },
    { $Type: 'UI.DataField', Value: Supplier.phone }

  ]
};


annotate purchaseOrderManagementSrv.PurchaseOrders with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'overviewTab',
    Label: 'Overview',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'purchaseOrderDetails', Label: 'Purchase Order Details', Target: '@UI.FieldGroup#purchaseOrderDetails' },
      { $Type: 'UI.ReferenceFacet', ID: 'supplierInformation', Label: 'Supplier Information', Target: '@UI.FieldGroup#supplierInformation' } ]
  }
];
annotate purchaseOrderManagementSrv.Suppliers with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate purchaseOrderManagementSrv.Suppliers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name', ID: 'Name' }
];
annotate purchaseOrderManagementSrv.Suppliers with @UI.HeaderInfo: {
  TypeName: 'Supplier',
  TypeNamePlural: 'Suppliers',
  Title: { Value: suppliersID }
};
annotate purchaseOrderManagementSrv.Suppliers with {
  ID @UI.Hidden
};
annotate purchaseOrderManagementSrv.Suppliers with @UI.Identification: [{ Value: suppliersID }];
annotate purchaseOrderManagementSrv.Suppliers with {
  suppliersID @Common.Label: 'ID';
  name @Common.Label: 'Name';
  email @Common.Label: 'Email';
  phone @Common.Label: 'Phone'
};
annotate purchaseOrderManagementSrv.Suppliers with @UI.SelectionFields: [
  suppliersID
];
annotate purchaseOrderManagementSrv.Suppliers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: suppliersID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: phone }
];
annotate purchaseOrderManagementSrv.Suppliers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: suppliersID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: phone }
]};
annotate purchaseOrderManagementSrv.Suppliers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];