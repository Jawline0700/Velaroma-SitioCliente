var express = require("express"),
ejs = require ("ejs");
const conexion = require('./database/db');
var app = express();
app.set("view engine","ejs");
app.use(express.static("public"));
app.use(express.json());


app.get ("/",(req,res)=>{
  conexion.query('SELECT * FROM inventario WHERE id_tipoprod = 4',(error,results)=>{
   if(error){
    throw error;
   }else{
    res.render("index",{pagina:1,results:results})
    console.log(results);
   }

  })
})

app.get("/quienes_somos",function(req, res) {
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

  
  
app.get ("/velas",(req,res)=>{
  conexion.query('SELECT * FROM inventario WHERE id_tipoprod = 3',(error,results)=>{
   if(error){
    throw error;
   }else{
    res.render("index",{pagina:3,results:results})
    console.log(results);
   }

  })
})



  
app.get ("/incienso",(req,res)=>{
  conexion.query('SELECT * FROM inventario WHERE id_tipoprod = 2',(error,results)=>{
   if(error){
    throw error;
   }else{
    res.render("index",{pagina:4,results:results})
    console.log(results);
   }

  })
})


  app.get("/personalizar",function(req, res) {
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

  app.get("/contactanos",function(req, res) {
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

  
  app.get("/pagos",function(req, res) {
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

app.set("port", process.env.PORT || 3000);

app.listen(app.get("port"), function() {
  console.log(
    "Servidor iniciado en http://localhost:" +
      app.get("port") +
      "; presiona Ctrl-C para terminar."
  );
});