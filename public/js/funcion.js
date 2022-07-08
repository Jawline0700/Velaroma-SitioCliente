
        $('.add-to-cart').click(function(event){
          event.preventDefault();
          alert('Producto agregado con exito')
        })

        


           function cambioImagen (id){
           var imagen = $("input[name=diseño]:checked").val();
            console.log(imagen)
            var images = new Array();
            images[id] = new Image();
            console.log(images[id].src = '../img/'+imagen);
            for(let i=0;i<=images.length;i++){
                if (id == [i])
                var img = document.getElementById("foto").src = images[i].src; 
            }

             }

            function validar() {
                let nombre = document.getElementById("name").value;
                let correo = document.getElementById("email").value;
                if (nombre == "") {
                    alert("El campo nombre esta vacio, por favor llene el campo"); 
                } else {
        
                    if (correo == "") {
                      alert("El campo correo esta vacio, por favor llene el campo"); 
                    } else {
                      alert("Tu mensaje fue enviado con exito :)");
                    }
                }
              }

function procesar(){
   var id_tipoprod = document.getElementById('id_producto').value;
   var nombre1 = document.getElementById('nombre').value;
   var  precio = document.getElementById('precio').value;
   var  nombre2 = document.getElementById('nombrepro').value;
   var precio2 = document.getElementById('preciopro').value;
   var nombre_final = nombre1+ '+'+ nombre2;
   var precio_final = Number.parseFloat(precio) + Number.parseFloat(precio2);
   agregarproducto(id_tipoprod,nombre_final,precio_final);


  
}