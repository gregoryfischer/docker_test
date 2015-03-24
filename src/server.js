var express = require('express');
var app = express();

var PORT = 8080;

app.get('/', function (req, res) {
  res.send('Hello World!')
});

app.get('/nam', function (req, res) {
  res.send('Python Rocks!')
});

var server = app.listen(PORT, function () {

  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);

});
