#! /usr/bin/env node
var fs = require('fs')
// var sys = require('sys')
// var exec = require('child_process').exec;

// console.log( process )
// console.log( process.argv )
console.time('readfile')
var rs = fs.createReadStream('/home/zhangwj/workspace/imr_tmp/java/src/com/v6/imr_tmp/pc/cust/valueIndex/ValueIndexCmd.java', {bufferSize: 11});
var data = ''
rs.on('data', function (chunk) {
	// console.log(chunk.toString('utf-8'));
	data += chunk
});
rs.on('end', function () {
	// cleanUp();
	console.log('done');
	console.log(data);
});
console.timeEnd('readfile')


// // executes `pwd`
// exec("ls", function (error, stdout, stderr) {

// 	sys.print('stdout: ' + stdout);
// 	sys.print('stderr: ' + stderr);

// 	if (error !== null) {
// 		console.log('exec error: ' + error);
// 	}

// });

// var add = function( a, b ){
// 	return a + b;
// }
// console.log(add( 1, 2, function(){
// 	console.log(11)
// } ))