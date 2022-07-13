// ************************************************
// Shopping Cart API
// ************************************************

var shoppingCart = (function () {
  // =============================
  // Private methods and propeties
  // =============================
  cart = [];

  // Constructor
  function Item(id, name, price, count) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.count = count;
  }

  // Save cart
  function saveCart() {
    sessionStorage.setItem('shoppingCart', JSON.stringify(cart));
  }

  // Load cart
  function loadCart() {
    cart = JSON.parse(sessionStorage.getItem('shoppingCart'));
  }
  if (sessionStorage.getItem("shoppingCart") != null) {
    loadCart();
  }


  // =============================
  // Public methods and propeties
  // =============================
  var obj = {};

  // Add to cart
  obj.addItemToCart = function (id, name, price, count) {
    for (var item in cart) {
      if (cart[item].id === id) {
        cart[item].count++;
        saveCart();
        return;
      }
    }
    var item = new Item(id, name, price, count);
    cart.push(item);
    saveCart();
  }
  // Set count from item
  obj.setCountForItem = function (id, name, count) {
    for (var i in cart) {
      if (cart[i].id === id) {
        cart[i].count = count;
        break;
      }
    }
  };
  // Remove item from cart
  obj.removeItemFromCart = function (id) {
    for (var item in cart) {
      if (cart[item].id === id) {
        cart[item].count--;
        if (cart[item].count === 0) {
          cart.splice(item, 1);
        }
        break;
      }
    }
    saveCart();
  }

  // Remove all items from cart
  obj.removeItemFromCartAll = function (id) {
    for (var item in cart) {
      if (cart[item].id === id) {
        cart.splice(item, 1);
        break;
      }
    }
    saveCart();
  }

  // Clear cart
  obj.clearCart = function () {
    cart = [];
    saveCart();
  }

  // Count cart 
  obj.totalCount = function () {
    var totalCount = 0;
    for (var item in cart) {
      totalCount += cart[item].count;
    }
    return totalCount;
  }

  // Total cart
  obj.totalCart = function () {
    var totalCart = 0;
    for (var item in cart) {
      totalCart += cart[item].price * cart[item].count;
    }
    return Number(totalCart.toFixed(2));
  }

  // List cart
  obj.listCart = function () {
    var cartCopy = [];
    for (i in cart) {
      item = cart[i];
      itemCopy = {};
      for (p in item) {
        itemCopy[p] = item[p];

      }
      itemCopy.total = Number(item.price * item.count).toFixed(2);
      cartCopy.push(itemCopy)
    }
    return cartCopy;
  }

  // cart : Array
  // Item : Object/Class
  // addItemToCart : Function
  // removeItemFromCart : Function
  // removeItemFromCartAll : Function
  // clearCart : Function
  // countCart : Function
  // totalCart : Function
  // listCart : Function
  // saveCart : Function
  // loadCart : Function
  return obj;
})();


// *****************************************
// Triggers / Events
// ***************************************** 
// Add item
$('.add-to-cart').click(function (event) {
  event.preventDefault();
  var id = $(this).data('id')
  var name = $(this).data('name');
  var price = Number($(this).data('price'));
  alert('Producto agregado con exito')
  shoppingCart.addItemToCart(id, name, price, 1);
  displayCart();
});

console.log(shoppingCart.listCart());
  const divpago = document.createElement("div");
  divpago.classList.add('totalpago')

  try{
    const shopCart = shoppingCart.listCart().map(function(element){
      return `<p>Nombre:${element.name}</p> <p>Precio:${element.price}</p> <p>CantidadxProducto:${element.count}</p>`;
    })
  total = shoppingCart.totalCart();
  itbms = shoppingCart.totalCart()*0.07;
  itbms_final = itbms.toFixed(2);
  totalfinal = shoppingCart.totalCart()+itbms;
  preciofinal = totalfinal.toFixed(2);
  const respuesta = `<div> <tr>${shopCart}</tr> <p>Subtotal: ${total}</p><p>ITBMS: ${itbms_final}<p>Total a pagar: ${preciofinal}</p> </div>`;
  console.log(`${respuesta}`);
 document.getElementById('order').innerHTML= `${respuesta}`;
  }catch(error){
    console.log(error);
  }
 

function agregarproducto(id, nombre, precio) {
  var idfinal = Number(id)
  shoppingCart.addItemToCart(idfinal, nombre, precio, 1);
  alert("Producto agregado con exito");
}




function almacenar_total(){
  total = shoppingCart.totalCart();
  itbms = shoppingCart.totalCart()*0.07;
  itbms_final = itbms.toFixed(2);
  totalfinal = shoppingCart.totalCart()+itbms;
  preciofinal = totalfinal.toFixed(2);
  return preciofinal;
}

function impuesto(){
   itbms = shoppingCart.totalCart()*0.07;
   itbms_final = itbms.toFixed(2);
   return itbms_final;
}

// Clear items
$('.clear-cart').click(function () {
  shoppingCart.clearCart();
  displayCart();
});


function displayCart() {
  var cartArray = shoppingCart.listCart();
  var output = "";
  for (var i in cartArray) {
    output += "<tr>"
      + "<td>" + cartArray[i].name + "</td>"
      + "<td>(" + cartArray[i].price + ")</td>"
      + "<td><div class='input-group'><button class='minus-item' data-id=" + cartArray[i].id + ">-</button>"
      + "<input type='number' readonly class='item-count' data-id='" + cartArray[i].id + "' value='" + cartArray[i].count + "'>"
      + "<button class='plus-item' data-id=" + cartArray[i].id + ">+</button></div></td>"
      + "<td><button class='delete-item ' data-id=" + cartArray[i].id + "><p class='equis'>X</p></button></td>"
      + " = "
      + "<td>" + cartArray[i].total + "</td>"
      + "</tr>";
  }
  $('.show-cart').html(output);
  $('.total-cart').html(shoppingCart.totalCart());
  $('.total-count').html(shoppingCart.totalCount());
}

function obtenerdatos(){
  var nombre = document.getElementById('name').value;
  var apellido = document.getElementById('apellido').value;
  var correo = document.getElementById('email').value;
  var numero1 = document.getElementById('numero1').value;
  var numero2 = document.getElementById('numero2').value
  var direccion = document.getElementById('direccion').value;
  var radio = Number.parseInt(document.getElementById('gift').value);
  var aux = " "
  if($('#gift').prop('checked')){
    aux = "3"
  }else{
    aux ="1";
  }
   var monto = almacenar_total();
   try{
    var cartArray = shoppingCart.listCart();
    var output = "";
    for (var i in cartArray) {
      output += "-Nombre: " + cartArray[i].name + "-Cantidad: " + cartArray[i].count;
    }
    var opc = {
      name: nombre,
      lastname: apellido,
      email: correo,
      tel1: numero1,
      tel2: numero2,
      dir:direccion,
      tipo:aux,
      total:monto,
      desc:output
    }
    alert("Pedido ingresado correctamente");
    var cadena = JSON.stringify(opc);
    fetch("http://localhost:3000/pagos",{
      method:"POST",
      headers:{
        "Content-Type":"application/json",
      },
      body:cadena
    })

   
   }catch(error){
    console.log(error);
   }




}




// Delete item button

$('.show-cart').on("click", ".delete-item", function(event) {
  var id = $(this).data('id')
  shoppingCart.removeItemFromCartAll(id);
  displayCart();
})


// -1
$('.show-cart').on("click", ".minus-item", function(event) {
  var id = $(this).data('id')
  shoppingCart.removeItemFromCart(id);
  displayCart();
})
// +1
$('.show-cart').on("click", ".plus-item", function(event) {
  var id = $(this).data('id')
  shoppingCart.addItemToCart(id);
  displayCart();
})

// Item count input
$('.show-cart').on("change", ".item-count", function(event) {
   var id = $(this).data('id');
   var count = Number($(this).val());
  shoppingCart.setCountForItem(id, count);
  displayCart();
});

displayCart();