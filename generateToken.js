//node ./generateToken.js '<domain_url>' '<client_id>' '<client_secret>' '<scope>'
'use strict';

const axios = require('axios');

const args = process.argv.slice(2);
const domainUrl = args[0];
const clientId = args[1];
const clientSecret = args[2];
let scope = null;
let data = null;

const grantType = 'client_credentials';
const auth = new Buffer.from(`${clientId}:${clientSecret}`).toString('base64');
if (args.lenght > 3) {
    data = `grant_type=${grantType}&scope=${scope}`;
} else {
    data = `grant_type=${grantType}`;
}

axios({
    method: 'post',
    url: 'oauth2/token',
    baseURL: `${domainUrl}`,
    headers: {
        'authorization': `Basic ${auth}`,
        'content-type': `application/x-www-form-urlencoded`
    },
    data: `${data}`
}).then(function (response) {
    console.log(response.data.access_token);
}).catch(function (error) {
    console.log(error.response.data.error);
});
