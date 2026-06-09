const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config();

const authrouter = require('./routes/auth');

const app = express();

const PORT = process.env.PORT || 3000;

console.log('Mongo URI Loaded:', process.env.MONGODB_URI ? 'YES' : 'NO');

app.use(express.json());

app.use(authrouter);

app.get('/', (req, res) => {
  console.log('GET / HIT');
  res.send('Server is running');
});

mongoose
  .connect(process.env.MONGODB_URI)
  .then(() => {
    console.log('MongoDB Connected Successfully');

    app.listen(PORT, '0.0.0.0', () => {
      console.log(`Server running on port ${PORT}`);
    });
  })
  .catch((err) => {
    console.error('MongoDB Connection Error:');
    console.error(err);
  });