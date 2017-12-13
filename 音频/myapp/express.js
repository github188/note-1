var express = require('express');
var app = express();
var Config = require( './config' )
var fs = require( 'fs' )

app.post('/uploadImg', function(req, res) {
  var nt = ( new Date() ).getTime();
  var fileWriteStream = fs.createWriteStream( `${Config.IMG_ROOT}${nt}.jpeg` );
  req.pipe( fileWriteStream )
  console.log( `图片已经上传到 ${Config.IMG_ROOT}${nt}.jpeg` )
  res.json({
    ok:true,
    data:`${Config.IMG_ROOT}${nt}.jpeg`
  })
});

app.get('/', function (req, res) {
  res.send('Hello World!');
});

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});