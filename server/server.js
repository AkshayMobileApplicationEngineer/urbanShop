const express = require('express');
const app = express();
const port  = 5500;

app.get('/', function(req, res) {
    res.send('Hello World');
});

app.get('/api/v1', (req, res) => {
    res.json({
        "name": "John",
        "age": 30
    });
});

// Use "0.0.0.0" to listen on all network interfaces
app.listen(port, () => {
    console.log(`Server is running on this URL: http://localhost:${port} click now `);
});