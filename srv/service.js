const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    this.before('*', async (req) => {
        console.log('********** AUTH DEBUG **********');
        console.log('User ID:', req.user.id);
        console.log('Roles:', req.user.roles);
        console.log('Scopes (Raw):', req.user._roles); 
        console.log('********************************');
    });
});