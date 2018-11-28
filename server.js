var express = require('express');
var app = express();
var fs = require('fs');

app.listen(3000, function() {
    console.log('Server Start');
})

app.get('/', function(req, res){
    fs.readFile('index.html', function (error, data) {
        if (error) {
            console.log(error);
        } else {
            res.writeHead(200, { 'Content-Type' : 'text/html'});
            res.end(data);
        }
    });
});