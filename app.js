var express = require("express"),
ejs = require ("ejs");
const morgan = require('morgan');
const conexion = require('./database/db');
const {PORT} = require('./config');


var app = express();
app.set("view engine","ejs");
app.use(express.static("public"));
app.use(express.json());

app.use(morgan('dev'));
app.use('/', require('./router'));

app.set("port", process.env.PORT || PORT);

app.listen(app.get("port"), function() {
  console.log(
    "Servidor iniciado en http://localhost:" +
      app.get("port") +
      "; presiona Ctrl-C para terminar."
  );
});