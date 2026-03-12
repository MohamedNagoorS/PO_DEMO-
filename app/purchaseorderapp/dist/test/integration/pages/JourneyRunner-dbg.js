sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"purchaseorderapp/test/integration/pages/PurchaseOrdersList",
	"purchaseorderapp/test/integration/pages/PurchaseOrdersObjectPage"
], function (JourneyRunner, PurchaseOrdersList, PurchaseOrdersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('purchaseorderapp') + '/test/flpSandbox.html#purchaseorderapp-tile',
        pages: {
			onThePurchaseOrdersList: PurchaseOrdersList,
			onThePurchaseOrdersObjectPage: PurchaseOrdersObjectPage
        },
        async: true
    });

    return runner;
});

