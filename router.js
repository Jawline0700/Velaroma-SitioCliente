const express = require('express');
const router = express.Router();

const conexion = require('./database/db');
const paypal = require('./public/js/paymentController');
const {PAYPAL_API_CLIENT} = process.env;

router.get ("/",(req,res)=>{
    conexion.query('SELECT * FROM inventario WHERE id_tipoprod = 4',(error,results)=>{
     if(error){
      throw error;
     }else{
      res.render("index",{pagina:1,results:results})
      console.log(results);
     }
  
    })
  })
  
  router.get("/quienes_somos",function(req, res) {
      res.type("text/html");
      res.render(
        "index",
        {
          pagina: 2
        },
        function(err, html) {
          if (err) throw err;
          res.send(html);
        }
      );
    });
  
    
    
  router.get ("/velas",(req,res)=>{
    conexion.query('SELECT * FROM inventario WHERE id_tipoprod = 3',(error,results)=>{
     if(error){
      throw error;
     }else{
      res.render("index",{pagina:3,results:results})
   
     }
  
    })
  })
  
    
  router.get ("/incienso",(req,res)=>{
    conexion.query('SELECT * FROM inventario WHERE id_tipoprod = 2',(error,results)=>{
     if(error){
      throw error;
     }else{
      res.render("index",{pagina:4,results:results})
  
     }
  
    })
  })

  router.get ("/personalizar",(req,res)=>{
    conexion.query('SELECT * FROM inventario WHERE id_tipoprod = 5',(error,results)=>{
     if(error){
      throw error;
     }else{
      conexion.query('SELECT * FROM inventario WHERE id_tipoprod = 6',(error,fragancias)=>{
        if(error){
          throw error;
        }
        else{
          res.render("index",{pagina:5,results:results,fragancias:fragancias})
          console.log(fragancias);
          console.log(results);
      
        }
      })
            }
  
    })
  })
  
  
  
  
    router.get("/contactanos",function(req, res) {
      res.type("text/html");
      res.render(
        "index",
        {
          pagina: 6
        },
        function(err, html) {
          if (err) throw err;
          res.send(html);
        }
      );
    });
  
    
    router.get("/pagos",function(req, res) {
      res.type("text/html");
      res.render(
        "index",
        {
          pagina: 7,
          PAYPAL_API_CLIENT: PAYPAL_API_CLIENT,
        },
        function(err, html) {
          if (err) throw err;
          res.send(html);
        }
      );
    });
//-------------------------------------------------------------------------------------
router.post("/api/orders", async (req, res) => {
  try {
    const order = await paypal.createOrder();
    res.json(order);
  } catch (err) {
    res.status(500).send(err.message);
  }
});

router.post("/api/orders/:orderID/capture", async (req, res) => {
  const { orderID } = req.params;
  try {
    const captureData = await paypal.capturePayment(orderID);
    res.json(captureData);
  } catch (err) {
    res.status(500).send(err.message);
  }
});


    module.exports = router;