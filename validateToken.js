//node ./validateToken.js '<user_pool_url>' '<token>'
'use strict';

const args = process.argv.slice(2);
const userPoolUrl = args[0];
const token = args[1];

const jwkToPem = require('jwk-to-pem');
const jwt = require('jsonwebtoken');
const axios = require('axios');


axios({
  method: 'get',
  url: '.well-known/jwks.json',
  baseURL: `${userPoolUrl}`
}).then(function (resp) {
  const jwks = resp.data.keys.slice(-1).pop();
  const pem = jwkToPem(jwks);
  jwt.verify(token, pem, { algorithms: ['RS256'] }, function (err, decoded) {
    if (err) {
      console.error(err);
    } else {
      console.log(decoded)
    }
  });
}).catch(function (err) {
  console.log(err);
});
