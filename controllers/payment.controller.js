const axios = require('axios');
const {PAYPAL_API, PAYPAL_API_CLIENT, PAYPAL_API_SECRET, HOST} = require('../config');


exports.createOrder = async (req, res) => {

    const order = {
        intent: 'CAPTURE', 
        purchase_units: [
            {
              "amount": {
                "currency_code": "USD",
                "value": "100.00"
              },
              description: "RAM",
            },
          ], 
        
        application_context: {
            brand_name: "Velaroma",
            landig_page: "LOGIN",
            user_action: "PAY_NOW",
            return_url: `${HOST}/capture-order`,
            cacel_url: `${HOST}/cancel-order`,
        }
    };
    
    const response = await axios.post(`${PAYPAL_API}/v2/checkout/orders`, order, {
        auth: {
            username: PAYPAL_API_CLIENT,
            password: PAYPAL_API_SECRET,
          },
    });

    console.log(response.data);
    

    res.send('creating an order')
};

exports.captureOrder = async (req, res) => {

    const {token } = req.query 

    const response = await axios.post(`${PAYPAL_API}/v2/checkout/orders/${token}/capture`, {}, {
        auth: {
            username: PAYPAL_API_CLIENT,
            password: PAYPAL_API_SECRET,
          },
    });

    console.log(response.data)

    res.send('capturing an order')
};

exports.cancelOrder = (req, res) => {
    res.send('cancel an order')
};