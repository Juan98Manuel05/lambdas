const db = require('./db');

exports.handler = async (event) => {
    try {
        const allProducts = await db.getAllProducts();
        const totalSalesByProduct = await db.getTotalSalesByProduct();
        const productWithHighestPrice = await db.getProductWithHighestPrice();

        const response = {
            allProducts,
            totalSalesByProduct,
            productWithHighestPrice
        };

        return {
            statusCode: 200,
            body: JSON.stringify(response),
        };
    } catch (error) {
        console.error('Error executing Lambda function', error);
        return {
            statusCode: 500,
            body: JSON.stringify({ message: 'Internal server error' }),
        };
    }
};
