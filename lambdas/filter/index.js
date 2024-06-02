const products = {
    "id": 1,
    "store": "Store Video Games",
    "items":[
        {
            id: "xbox-360",
            name: "Xbox 360",
            description: "Console Video Games",
            value: 8.999,
            type: "$",
            valueStr: "$8.999"
        },
        {
            id: "ps-3",
            name: "Play Station 3",
            description: "Console Video Games",
            value: 11.999,
            type: "$",
            valueStr: "$11.999"
        },
        {
            id: "xbox-one",
            name: "Xbox One",
            description: "Console Video Games",
            value: 12.999,
            type: "$",
            valueStr: "$12.999"
        },
        {
            id: "ps-5",
            name: "Play Station 5",
            description: "Console Video Games",
            value: 15.999,
            type: "$",
            valueStr: "$15.999"
        },
        {
            id: "nintendo-swift",
            name: "Nintento Swift",
            description: "Console Video Games",
            value: 18.999,
            type: "$",
            valueStr: "$18.999"
        },
    
    ]
}

exports.handler = async (event) => {
    try {
        const price = event.price
        const items = products.items
        const productsFilter = items.filter(product => product.value > price) // filter products by price
        const listProductName = productsFilter.map(productFilter => productFilter.name.toUpperCase()) // transform text name products to uppercase
        
        return {
            statusCode: 200,
            body: listProductName
        }
    } catch (error) {
        return {
            statusCode: 500,
            body: JSON.stringify({message: "Fatal error", error: error.message})
        }
    }
}