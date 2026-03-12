using { purchaseOrderManagement } from '../db/schema.cds';

service purchaseOrderManagementSrv {

  @odata.draft.enabled
  @restrict: [
    { grant: ['READ'], to: 'Employee' },
    { grant: ['READ','WRITE'], to: 'Manager' },
    { grant: ['READ','WRITE','DELETE'], to: 'Admin' }
  ]
  entity PurchaseOrders as projection on purchaseOrderManagement.PurchaseOrders;

  @restrict: [
    { grant: ['READ'], to: ['Employee','Manager','Admin'] },
    { grant: ['WRITE'], to: 'Admin' }
  ]
  entity Suppliers as projection on purchaseOrderManagement.Suppliers;

}