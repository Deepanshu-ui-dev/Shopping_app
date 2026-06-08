const express = require('express');
const User = require('../models/user');

const authrouter = express.Router();
const bcryptjs = require('bcryptjs');

authrouter.post('/api/signup', async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });

    if (existingUser) {
      return res.status(400).json({
        message: 'User already exists',
      });

    };
    const hashedPassword = await bcryptjs.hash(password, 8);

    const user = new User({
      name,
      email,
      password: hashedPassword,
    });

    await user.save();

    res.status(201).json({
      message: 'User created successfully',
      user,
    });
  } catch (err) {
    res.status(500).json({
      error: err.message,
    });
  }
});

module.exports = authrouter;