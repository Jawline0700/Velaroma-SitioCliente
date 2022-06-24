const mysql = require('mysql');
const conexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'velaroma'
});

conexion.connect((error)=>{
    try{

    if(error){
        console.error('El error de conexion es:'+ error);
        return;
    }else{
        console.log('¡Conectado a la Base de Datos!');
    }
    }catch(x){
        console.log('---Error--'+ x);
    }
});

module.exports = conexion ;