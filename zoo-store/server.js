const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();
const port = 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Database connection
const pool = new Pool({
  user: 'your_username',
  host: 'localhost',
  database: 'zoo_store',
  password: 'your_password',
  port: 5432,
});

// Root route
app.get('/', (req, res) => {
  res.send('Welcome to the Zoo Store API');
});

// API Routes
app.get('/api/products', async (req, res) => {
  try {
    const { rows } = await pool.query('SELECT * FROM products');
    res.json(rows);
  } catch (err) {
    console.error('Error fetching products:', err);
    res.status(500).json({ error: 'Internal server error', details: err.message });
  }
});

// Add more API routes here

app.get('/api/test', async (req, res) => {
  try {
    const { rows } = await pool.query('SELECT NOW()');
    res.json(rows);
  } catch (err) {
    console.error('Error testing database connection:', err);
    res.status(500).json({ error: 'Database connection error', details: err.message });
  }
});

app.get('/api/check-table', async (req, res) => {
  try {
    const { rows } = await pool.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'products'
    `);
    res.json(rows);
  } catch (err) {
    console.error('Error checking products table:', err);
    res.status(500).json({ error: 'Error checking products table', details: err.message });
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
