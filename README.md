# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.


This CAP project and the included SAP Fiori application were generated with the Project Accelerator, using the prompt: Generate a full-stack SAP CAP application for Purchase Order Management using SAP Build Code and SAP BTP.

Application Requirements:

Architecture:

\* Use SAP CAP (Node.js)
\* Use SAP HANA Cloud as the database
\* Use an HDI container for persistence
\* Expose services using OData V4
\* Deployable to SAP BTP Cloud Foundry

Database Model:
Create the following entities:

1. PurchaseOrders

\* ID (integer,key)
\* supplierName (String)
\* productName (String)
\* quantity (Integer)
\* price (Decimal)
\* totalAmount (calculated = quantity \* price)
\* status (String: Created, Approved, Rejected)
\* createdAt (Timestamp)

2. Suppliers

\* ID (integer)
\* name (String)
\* email (String)
\* phone (String)

Add an association:
PurchaseOrders → Supplier

Backend Service:
Create a service called PurchaseOrderService exposing:

\* READ PurchaseOrders
\* CREATE PurchaseOrders
\* UPDATE PurchaseOrders
\* DELETE PurchaseOrders
\* READ Suppliers

Authorization (Role-Based Access Control):
Use XSUAA for authentication.

Define roles:

Admin

\* Full access
\* Can create, update, delete purchase orders
\* Can view suppliers

Manager

\* Can approve or reject purchase orders
\* Can view purchase orders

Employee

\* Can create purchase orders
\* Can only view their own purchase orders

Create xs-security.json with scopes and role templates.

Add authorization annotations in CDS services to enforce role-based access.

Frontend:
Generate a SAP Fiori Elements application with:

List Report Page

\* Displays Purchase Orders
\* Filter by Supplier and Status

Object Page

\* View Purchase Order details
\* Create new Purchase Orders
\* Edit existing Purchase Orders

Role Behavior:
Admin → full access UI
Manager → approve&#x2F;reject actions visible
Employee → only create and view own orders

Use SAP Fiori UI5 and connect it to PurchaseOrderService.

Deployment:
Include:

\* mta.yaml
\* xs-security.json
\* HANA HDI container configuration
\* service bindings for HANA and XSUAA

The generated project structure should follow SAP CAP standards:

project-root
├── app&#x2F;
│ └── purchaseorder-ui
├── db&#x2F;
│ └── schema.cds
├── srv&#x2F;
│ └── purchase-service.cds
├── xs-security.json
├── package.json
└── mta.yaml

Ensure the application can be deployed to SAP BTP and the database artifacts automatically deploy to SAP HANA Cloud..
