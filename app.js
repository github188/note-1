#! /usr/bin/env node
// var fs = require('fs')
// var sys = require('sys')
// var exec = require('child_process').exec;

// console.log( process )
// console.log( process.argv )

// var rs = fs.createReadStream('/git/note/linux/restart.sh');

// rs.on('data', function (chunk) {
// 	console.log(chunk.toString('utf-8'));
// });

// rs.on('end', function () {
// 	// cleanUp();
// 	console.log('done');
// });



// // executes `pwd`
// exec("ls", function (error, stdout, stderr) {

// 	sys.print('stdout: ' + stdout);
// 	sys.print('stderr: ' + stderr);

// 	if (error !== null) {
// 		console.log('exec error: ' + error);
// 	}

// });

var add = function( a, b ){
	return a + b;
}
console.log(add( 1, 2, function(){
	console.log(11)
} ))