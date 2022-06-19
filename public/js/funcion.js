
        function hizoClick() {
            alert("Pedido añadido con exito :)"); 
        }

        function aromaClick() {
            alert("Añadido :)"); 
        }

        function cambioImagen (id) {
            var images = new Array();

            images[0] = new Image();
            images[0].src = '../img/Vela1.jpeg';

            images[1] = new Image();
            images[1].src = '../img/Vela2.jpeg';

            images[2] = new Image();
            images[2].src = '../img/Vela3.jpeg';

            images[3] = new Image();
            images[3].src = '../img/Vela4.jpeg';

            images[4] = new Image();
            images[4].src = '../img/Vela5.jpeg';

            const center = document.querySelector('.center')
            for(let i=0; i <= images.length; i++) {
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