  var Client = require('ftp');

  var c = new Client();

  c.on('ready', function() {
    c.list(function(err, list) {
      if (err) throw err;
      console.dir(list);
      c.end();
    });
  });
  // connect to localhost:21 as anonymous
  c.connect({
      host: '10.110.1.208',
      port: '21',
      user: 'root',
      password: 'inspur'
  })