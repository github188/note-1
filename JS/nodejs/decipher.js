const crypto = require('crypto');
const fs = require('fs');
const decipher = crypto.createDecipher('aes192', 'myf');

const decodeFile = ( src, dest )=>{
	dest = dest ? dest : src
	const input = fs.createReadStream( `${src}` );
	const output = fs.createWriteStream( `${dest}` );
	input.pipe(decipher).pipe(output);
}

// 执行用 node decipher.js [源文件名] [解密后文件名] 不加后两个参数，解密本文件夹下所有文件
if( process.argv.length == 2 ){
	// 将目录下的所有文件都加密
	fs.readdir( __dirname, function( err, files ){
		console.log( files )
		files.forEach( function( f ){
			if( f == __filename )
				return
			let st = fs.statSync( f )
			if( st.isFile() ){
				decodeFile( f )
				console.log(`${f}解密完成`)
			}
		})
	})
}else{
	let src = process.argv[2]
	let dest = process.argv[3] || ''
	decodeFile( src, dest )
	console.log( `${src}解密完成` )
}