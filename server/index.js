const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config();

const authrouter = require('./routes/auth');

const app = express();

const PORT = process.env.PORT || 3000;

const DB = process.env.MONGODB_URI;

// Middleware
app.use(express.json());

// Routes
app.use(authrouter);

// MongoDB Connection
mongoose
  .connect(DB)
  .then(() => {
    console.log('MongoDB Connected Successfully');

    app.listen(PORT, '0.0.0.0', () => {
      console.log(`Server running on port ${PORT}`);
    });
  })
  .catch((err) => {
    console.log('MongoDB Error:', err);
  });