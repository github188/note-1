const crypto = require('crypto');
const fs = require('fs');
const cipher = crypto.createCipher('aes192', 'myf');

const encodeFile = ( src, dest )=>{
	dest = dest ? dest : src
	const input = fs.createReadStream( `${src}` );
	const output = fs.createWriteStream( `${dest}.enc` );
	input.pipe( cipher ).pipe( output );
}

// 执行用 node cipher.js [源文件名] [加密后文件名] 不加后两个参数，加密本文件夹下所有文件
if( process.argv.length == 2 ){
	// 将目录下的所有文件都加密
	fs.readdir( __dirname, function( err, files ){
		console.log( files )
		files.forEach( function( f ){
			if( f == __filename )
				return
			let st = fs.statSync( f )
			if( st.isFile() ){
				encodeFile( f )
				console.log(`${f}加密完成`)
			}
		})
	})
}else{
	let src = process.argv[2]
	let dest = process.argv[3] || ''
	encodeFile( src, dest )
	console.log( `${src}加密完成` )
}