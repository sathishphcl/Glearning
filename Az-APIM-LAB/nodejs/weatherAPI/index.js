const express=require('express');
const app=express();

app.get('/api/weather', (req, res)=>  {
    var temp=parseInt(Math.random() * (20));
    res.send("Hello Dear Students , Welcome to a brand new application , The Temperature today is: " + temp);
});

app.listen(8080, ()=>console.log('Listening on port 8080'));
