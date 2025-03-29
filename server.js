const express = require('express');
const mysql = require('mysql');
const multer = require('multer');
const AWS = require('aws-sdk');
const path = require('path');
const dotenv = require('dotenv');
const fs = require('fs');

dotenv.config();

const app = express();
const port = 3000;

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// Configure AWS SDK
const s3 = new AWS.S3({
    region: process.env.AWS_REGION
});

// Configure MySQL connection
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

db.connect((err) => {
    if (err) {
        console.error('Database connection failed:', err.stack);
        return;
    }
    console.log('Connected to database.');
});

// Configure Multer for file uploads
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

// Handle form submission
app.post('/add-employee', upload.single('document'), async (req, res) => {
    const { emp_id, name, email, position } = req.body;
    const file = req.file;

    if (!file) {
 return res.status(400).send('No file uploaded.');
    }

    // Upload file to S3
    const uploadParams = {
        Bucket: process.env.S3_BUCKET_NAME,
        Key: `documents/${emp_id}${path.extname(file.originalname)}`,
        Body: file.buffer
    };

    try {
        const data = await s3.upload(uploadParams).promise();
        const s3FileUrl = data.Location;

        // Insert employee details into MySQL database
        const sql = 'INSERT INTO employees (emp_id, name, email, position, document_url) VALUES (?, ?, ?, ?, ?)';
        db.query(sql, [emp_id, name, email, position, s3FileUrl], (err, result) => {
            if (err) {
                console.error('Error inserting data into database:', err);
                return res.status(500).send('Error saving employee details.');
            }
            res.send('Employee added successfully.');
        });
    } catch (err) {
        console.error('Error uploading file to S3:', err);
        res.status(500).send('Error uploading document.');
    }
});

app.listen(port, () => {
    console.log(`Server running at http://65.0.3.235:${port}/`);
});

