const crypto = require('crypto');
const readline = require('readline');

const decode = ( encrypted )=>{
	const decipher = crypto.createDecipher( 'aes192', 'passwd' );
	let decrypted = decipher.update( encrypted, 'hex', 'utf8' );
	decrypted += decipher.final( 'utf8' );
	return decrypted;
}

const rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	prompt: '请输入> '
});

rl.prompt();

rl.on( 'line', ( input ) => {
	console.log(`解密后：${ decode( input ) }`);
}).on('close', () => {
	console.log('结束!');
	process.exit( 0 );
});