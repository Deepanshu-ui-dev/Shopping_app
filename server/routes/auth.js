const express = require('express');
const bcryptjs = require('bcryptjs');
const User = require('../models/user');

const authrouter = express.Router();

authrouter.post('/api/signup', async (req, res) => {
  console.log('========== SIGNUP HIT ==========');
  console.log('Request Body:', req.body);

  try {
    const { name, email, password } = req.body;

    // Check required fields
    if (!name || !email || !password) {
      return res.status(400).json({
        msg: 'Please provide name, email and password',
      });
    }

    // Check if user already exists
    const existingUser = await User.findOne({ email });

    if (existingUser) {
      return res.status(400).json({
        msg: 'User with same email already exists!',
      });
    }

    // Hash password
    const hashedPassword = await bcryptjs.hash(password, 8);

    // Create user
    let user = new User({
      name,
      email,
      password: hashedPassword,
    });

    // Save user
    user = await user.save();

    console.log('========== USER SAVED ==========');
    console.log(user);

    // In auth.js — don't send password back
    const { password: _, ...userWithoutPassword } = user.toObject();
    res.status(201).json({
  msg: 'User created successfully',
  user: userWithoutPassword,
   });
  } catch (e) {
    console.error('Signup Error:', e);

    res.status(500).json({
      error: e.message,
    });
  }
});

module.exports = authrouter;