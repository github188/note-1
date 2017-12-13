const crypto = require('crypto');
const fs = require('fs');
const decipher = crypto.createDecipher('aes192', 'myf');

const input = fs.createReadStream('test.enc');
const output = fs.createWriteStream('nodejs1.zip');

input.pipe(decipher).pipe(output);