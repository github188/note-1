const crypto = require('crypto');
const fs = require('fs');
const CIPHER_SECTURE = 'myf'

let state = 'done' // 未开始
let tasks = []

const encodeFile = ( src, dest )=>{
	if( state == 'ing' ){ //进行中，则把任务缓存
		console.log( '执行中，缓存任务' )
		tasks.push( { src: src, dest: dest } )
		return
	}
	state = 'ing'
	dest = dest ? dest : src + '.enc'
	const input = fs.createReadStream( `${src}` );
	const output = fs.createWriteStream( `${dest}` );
	const cipher = crypto.createCipher('aes192', CIPHER_SECTURE);
	input.pipe( cipher ).pipe( output );

	const _goon = ()=>{ //继续执行
		if( state == 'done' && tasks.length ){
			console.log( '继续执行' )
			const task = tasks.pop()
			encodeFile( task.src, task.dest )
		}
	}

	input.on( 'close', ()=>{
		if( state == 'done2' ){ //输出流关闭
			state = 'done'
		}else{
			state = 'done1'
		}
		_goon()
	})
	output.on( 'close', ()=>{
		if( state == 'done1' ){ //输出流关闭
			state = 'done'
		}else{
			state = 'done2'
		}
		_goon()
	})

	console.log(`${src}加密完成`)
}

// 执行用 node cipher.js [源文件名] [加密后文件名] 不加后两个参数，加密本文件夹下所有文件
if( process.argv.length == 2 ){
	// 将目录下的所有文件都加密
	var files = fs.readdirSync( __dirname )
	files.forEach( function( f ){
		if( ( f == __filename.replace( __dirname, '' ).replace( /[\\/]/, '' ) ) || f.endsWith( '.enc' ) )
			return
		let st = fs.statSync( f )
		if( st.isFile() ){
			encodeFile( f )
		}
	})
}else{
	let src = process.argv[2]
	let dest = process.argv[3] || ''
	encodeFile( src, dest )
}
