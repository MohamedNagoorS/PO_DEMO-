using { sap.common.CodeList } from '@sap/cds/common';

namespace purchaseOrderManagement;

entity PurchaseOrdersStatusCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(20);
  criticality : Integer;
}

entity PurchaseOrders {
  key ID: UUID;
  purchaseOrdersID: Integer @assert.unique @mandatory;
  supplierName: String(50);
  productName: String(50);
  quantity: Integer;
  price: Decimal;
  totalAmount: Decimal;
  status: Association to PurchaseOrdersStatusCodeList;
  createdAt: Timestamp;
  Supplier: Association to Suppliers;
}

entity Suppliers {
  key ID: UUID;
  suppliersID: Integer @assert.unique @mandatory;
  name: String(50);
  email: String(50);
  phone: String(20);
}
