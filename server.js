const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());

// Database connection
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

// Serve static files from the React frontend app
app.use(express.static(path.join(__dirname, 'frontend/build')));

// Routes
app.get('/api/products', async (req, res) => {
  let client;
  try {
    client = await pool.connect();
    console.log('Connected to database in /api/products route');
    
    const result = await client.query('SELECT * FROM products');
    res.json(result.rows);
  } catch (error) {
    console.error('Error in /api/products route:', error);
    res.status(500).json({ error: 'Internal server error', details: error.message });
  } finally {
    if (client) client.release();
  }
});

// Add more routes for categories, users, orders, etc.

// After your API routes, add this:
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'frontend/build', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
