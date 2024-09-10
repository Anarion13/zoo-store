const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors({
  origin: 'https://capable-kheer-8628ec.netlify.app/'
}));
app.use(express.json());

// Database connection
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

// Routes
app.get('/', (req, res) => {
  res.send('Hello World!');
});

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

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
