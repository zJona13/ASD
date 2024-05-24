// Funcion de Contador
function countdown() {
    const endDate = new Date('2024-05-31 00:00:00').getTime();

    const timer = setInterval(function() {
        const now = new Date().getTime();
        const distance = endDate - now;

        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

        document.getElementById('days').innerText = days;
        document.getElementById('hours').innerText = hours;
        document.getElementById('minutes').innerText = minutes;
        document.getElementById('seconds').innerText = seconds;

        if (distance < 0) {
            clearInterval(timer);
            document.getElementById('countdown').innerHTML = 'Sale has ended';
        }
    }, 1000);
}

countdown();

// Funcion del Producto
// document.addEventListener("DOMContentLoaded", function() {
//     const addToCartButtons = document.querySelectorAll(".fa-shopping-cart");

//     addToCartButtons.forEach(button => {
//         button.addEventListener("click", function(event) {
//             event.preventDefault();
//             const productElement = this.closest(".product-grid");
//             const product = {
//                 title: productElement.querySelector(".card-title").textContent,
//                 description: productElement.querySelector(".card-text").textContent,
//                 price: parseFloat(productElement.querySelector(".card-text[style='color: red;']").textContent.replace('S/', '')),
//                 image: productElement.querySelector(".pic-1").src,
//                 quantity: 1
//             };
//             addToCart(product);
//             alert("Producto agregado al carrito");
//         });
//     });

//     function addToCart(product) {
//         let cart = JSON.parse(localStorage.getItem("cart")) || [];
//         const existingProductIndex = cart.findIndex(item => item.title === product.title);
//         if (existingProductIndex >= 0) {
//             cart[existingProductIndex].quantity += 1;
//         } else {
//             cart.push(product);
//         }
//         localStorage.setItem("cart", JSON.stringify(cart));
//     }
// });




//PEDRO
function addToCart(product_id) {
    $.ajax({
        url: '/add_to_cart',
        type: 'POST',
        data: { product_id: product_id, cantidad: 1 },
        success: function(response) {
            alert('Producto añadido al carrito');
        },
        error: function() {
            alert('Error al añadir el producto al carrito');
        }
    });
}

