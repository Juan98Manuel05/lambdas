const mysql = require('mysql2/promise');
const AWS = require('aws-sdk');
const secretsManager = new AWS.SecretsManager();

let connection;

async function getDbConfig() {
    const secretName = process.env.SECRETS_MANAGER_SECRET_NAME;
    const secret = await secretsManager.getSecretValue({ SecretId: secretName }).promise();
    return JSON.parse(secret.SecretString);
}

async function connectToDatabase() {
    if (!connection) {
        const dbConfig = await getDbConfig();
        connection = await mysql.createConnection({
            host: dbConfig.host, // dbConfig.host
            user: dbConfig.username, // dbConfig.username
            password: dbConfig.password, // dbConfig.password
            database: dbConfig.database, // dbConfig.database
        });
    }
    return connection;
}

async function getAllProducts() {
    const conn = await connectToDatabase();
    const [rows] = await conn.query('SELECT * FROM product');
    return rows;
}

async function getTotalSalesByProduct() {
    const conn = await connectToDatabase();
    const [rows] = await conn.query('SELECT product_id, SUM(price) as total_sales FROM sale GROUP BY product_id');
    return rows;
}

async function getProductWithHighestPrice() {
    const conn = await connectToDatabase();
    const [rows] = await conn.query('SELECT pr.name, sl.price FROM sale AS sl INNER JOIN product AS pr ON pr.id = sl.product_id ORDER BY price DESC LIMIT 1');
    return rows[0];
}

module.exports = {
    getAllProducts,
    getTotalSalesByProduct,
    getProductWithHighestPrice
};
