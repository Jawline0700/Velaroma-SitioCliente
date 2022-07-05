const express = require('express');
const router = express.Router();

const conexion = require('./database/db');


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
      console.log(results);
     }
  
    })
  })
  
  
  
    
  router.get ("/incienso",(req,res)=>{
    conexion.query('SELECT * FROM inventario WHERE id_tipoprod = 2',(error,results)=>{
     if(error){
      throw error;
     }else{
      res.render("index",{pagina:4,results:results})
      console.log(results);
     }
  
    })
  })
  
  
    router.get("/personalizar",function(req, res) {
      res.type("text/html");
      res.render(
        "index",
        {
          pagina: 5
        },
        function(err, html) {
          if (err) throw err;
          res.send(html);
        }
      );
    });
  
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
          pagina: 7
        },
        function(err, html) {
          if (err) throw err;
          res.send(html);
        }
      );
    });

    const paymentControllers = require ('./controllers/payment.controller');

    router.post('/create-order', paymentControllers.createOrder);

    router.get('/capture-order', paymentControllers.captureOrder);

    router.get('/cancel-order', paymentControllers.cancelOrder);


    module.exports = router;