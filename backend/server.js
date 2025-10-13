const express = require('express');
const app = express();
app.get('/api/health', (req, res) => res.json({status: 'ok'}));
app.get('/api/hello', (req, res) => res.json({msg: 'hello from backend'}));
app.listen(3001, () => console.log('backend listening on 3001'));
