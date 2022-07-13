const conexion = require('../database/db');
//GUARDAR un REGISTRO
exports.save = (req, res)=>{
    const nombre = req.body.nombre;
    const apellido = req.body.apellido;
    const email = req.body.email;
    const numero = req.body.numero1;
    const telefono = req.body.numero2;
    const direccion = req.body.direccion;
    var tipopedido = req.body.gift;
       if(tipopedido == 3 ){
            tipopedido = 3;
           }else{tipopedido = 1;}
  
       var monto = almacenar_total();
       var cartArray = shoppingCart.listCart();
       var output = "";
       for (var i in cartArray) {
         output += "-Nombre: " + cartArray[i].name + "-Cantidad: " + cartArray[i].count;
        }
        conexion.query('call insertar_pedidos(?,?,?,?,?,?,?,?,?,?)',[nombre,apellido,email,numero,telefono,direccion,monto,1,tipopedido,output],(error, results)=>{
            if(error){
                console.log(error);
            }else{   
                res.redirect('/');         
            }
    });

    
};