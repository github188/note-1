#! /usr/bin/env node
var fs = require('fs')
var path = require('path');
// var sys = require('sys')
// var exec = require('child_process').exec;

// console.log( process )
// console.log( process.argv )
// console.time('readfile')
// var rs = fs.createReadStream('/home/zhangwj/workspace/imr_tmp/java/src/com/v6/imr_tmp/pc/cust/valueIndex/ValueIndexCmd.java', {bufferSize: 11});
// var data = ''
// rs.on('data', function (chunk) {
// 	// console.log(chunk.toString('utf-8'));
// 	var reg = /getValueIndexService.*/g
// 	var ch = chunk + ''
// 	ch = ch.replace( /getValue/g, '悟空转今何在' )
// 	data += ch
// 	console.log(data);
// 	console.log( '万恶的分割线-----------------------------------万恶的分割线' )
// });
// rs.on('end', function () {
// 	// cleanUp();
// });
// console.timeEnd('readfile')


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
var src = `/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P/2wBDARESEhgVGC8aGi9jQjhCY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P/wAARCABCADIDASIAAhEBAxEB/8QAGwAAAQUBAQAAAAAAAAAAAAAAAAEDBQYHAgT/xAA4EAABAwMCBAMEBgsAAAAAAAABAAIRAwQhBRIxQVFhBhMUFpGy0iIjMnGBoRUkM1JiY3OxwtHh/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAEC/8QAFxEBAQEBAAAAAAAAAAAAAAAAABEBIf/aAAwDAQACEQMRAD8AkdH8aWzmtpahRFuQIFSk2WRnEcQOA5/gmvFfiDTri3daUKVO6qxiqRLWTxgjM4HDHXgQqTKAohR0Sg9PekSgfgUBOJJQlA7JQ2BARXGeUR9yE5A6lCIZcC1pd0BK91LSrqpRp1S63Y2q0ObveRg56LzXkCg6qym5lF4IZvO44wcwOfZXjR6QOk2Z/kM EIqtN8O6gQCDbxxH1jvlS zt CNxt8nEOcf8VdG0h0QaEvDtxgAjbyPDP5fmnRW7KlremUnU7Q2LHuwKuyXgTJE7cg9 gUVf6fqZdWu7ipa7mDe7YC2YHIAAThXd1IdF4NXYP0Tef0H/AAlTqxTaLXuoscJEtBgAoWoaC9g0DTvpAfqtLn/AELUZZNUazyXw0fZPLstC0QE6PY4H7Cn8IWfVBuY9oxMhSFPxDq7LOjb2z6FNtFoYHMZuJAECZnoouNCbMZABnqgk7gNvImeQWdHxJroZPrGx 95be/ZNe02tvfHrQSOH1TPlSdtGiB5qMDgyCcw6Rj3Ji7pCrRqU3iWPaWkdQQqO3W/ETgCLh5B5 S35Vw7VdaJNZ1UudtLC707CY5iY4Si1HMjy2yBwCF5fKf0KESalbSzc5rrq6B2CXBp5916d9WoHOp04EjbJEETlSJGITRiIMQqyjrqqWVW/SDjE4PBeD0d06oNtNxkceSnWsoB0wyRzKd3AZGfuEqZnRF2dtfB4NR5YGjEndHZSFJlw0u31qbxyBZH9k55jZjPuKXdPAHHaEVx5QOSKcnrT/wCoThLp yfeP9oQB4JogE5QhUdjAx0SoQgVdNy7PRCEHZAngEIQiP/Z`
var b = Buffer.from( src, 'base64')
var b1 = Buffer.from( src.replace( /\s/g, '' ), 'base64')
var b2 = Buffer.from( src.replace( /\s/g, '+' ), 'base64')

// var ws = fs.createWriteStream('E://test.jpeg', {bufferSize: 11});

// var exiists = fs.existsSync( 'E://ihav/apen/' )

//创建多层文件夹 同步
function mkdirsSync(dirpath) { 
    if (!fs.existsSync(dirpath)) {
        var pathtmp;
        dirpath.split( '/' ).forEach(function(dirname) {
            if (pathtmp) {
                pathtmp = path.join(pathtmp, dirname);
            }
            else {
                pathtmp = dirname;
            }
            if (!fs.existsSync(pathtmp)) {
                if (!fs.mkdirSync(pathtmp)) {
                    return false;
                }
            }
        });
    }
    return true; 
}

mkdirsSync( 'E://ihav/apen/' )

fs.writeFile('E://ihav/apen/test1.jpeg',b,function(err){
		console.log('has finished')
	})
fs.writeFile('E://ihav/apen/test2.jpeg',b1,function(err){
    console.log('has finished')
})
fs.writeFile('E://ihav/apen/test3.jpeg',b2,function(err){
    console.log('has finished')
})