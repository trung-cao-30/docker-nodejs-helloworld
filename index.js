var express = require('express');
var app = express();

app.get('/', function (req, res) {
    res.send('Hello World');
})

const listener = app.listen(process.env.PORT || 8081, function () {
    console.log("Your app is listening on port " + listener.address().port);
});