var express = require('express');
var app = express();

var fs = require( 'fs' )

// respond with "hello world" when a GET request is made to the homepage
app.get('/uploadImg', function(req, res) {
  var fileWriteStream = fs.createWriteStream('./new_myjpg.jpg',wOption);
  req.pipe( fileWriteStream )
  res.send('hello world');
});