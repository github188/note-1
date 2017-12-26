const crypto = require('crypto');
const readline = require('readline');

const encode = ( str )=>{
	const cipher = crypto.createCipher('aes192', 'passwd');
	let encrypted = cipher.update( str, 'utf8', 'hex');
	encrypted += cipher.final('hex');
	return encrypted;
}

const rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	prompt: '请输入> '
});

rl.prompt();

rl.on( 'line', ( input ) => {
	console.log(`加密后：${ encode( input ) }`);
}).on('close', () => {
	console.log('结束!');
	process.exit( 0 );
});