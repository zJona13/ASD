// document.addEventListener("DOMContentLoaded", function() {
//     const cartItemsContainer = document.getElementById("cart-items");
//     const orderSummaryContainer = document.getElementById("order-summary");
//     const clearCartButton = document.getElementById("clear-cart");
//     const applyDiscountButton = document.getElementById("apply-discount");

//     function renderCart() {
//         let cart = JSON.parse(localStorage.getItem("cart")) || [];
//         cartItemsContainer.innerHTML = "";
//         orderSummaryContainer.innerHTML = "";
//         let total = 0;

//         cart.forEach((product, index) => {
//             const productTotal = product.price * (product.quantity || 1);
//             total += productTotal;

//             const productElement = document.createElement("tr");
//             productElement.innerHTML = `
//                 <td>
//                     <div class="d-flex align-items-center">
//                         <img src="${product.image}" class="img-fluid mr-3">
//                         <div>
//                             <h5 class="mb-1">${product.title}</h5>
//                             <p class="mb-0">${product.description}</p>
//                         </div>
//                     </div>
//                 </td>
//                 <td>S/${product.price.toFixed(2)}</td>
//                 <td>
//                     <button class="btn btn-sm btn-outline-secondary" data-index="${index}" data-action="decrease">-</button>
//                     <span class="mx-2">${product.quantity || 1}</span>
//                     <button class="btn btn-sm btn-outline-secondary" data-index="${index}" data-action="increase">+</button>
//                 </td>
//                 <td>S/${productTotal.toFixed(2)}</td>
//                 <td>
//                     <button class="btn btn-sm btn-danger remove-item" data-index="${index}">&times;</button>
//                 </td>
//             `;
//             cartItemsContainer.appendChild(productElement);

//             const summaryItem = document.createElement("li");
//             summaryItem.textContent = `${product.title} - S/${product.price.toFixed(2)}`;
//             orderSummaryContainer.appendChild(summaryItem);
//         });

//         const summaryTotal = document.createElement("li");
//         summaryTotal.classList.add("font-weight-bold");
//         summaryTotal.textContent = `Total: S/${total.toFixed(2)}`;
//         orderSummaryContainer.appendChild(summaryTotal);

//         document.querySelectorAll(".remove-item").forEach(button => {
//             button.addEventListener("click", function() {
//                 const index = this.getAttribute("data-index");
//                 removeFromCart(index);
//             });
//         });

//         document.querySelectorAll("button[data-action='increase']").forEach(button => {
//             button.addEventListener("click", function() {
//                 const index = this.getAttribute("data-index");
//                 updateQuantity(index, 1);
//             });
//         });

//         document.querySelectorAll("button[data-action='decrease']").forEach(button => {
//             button.addEventListener("click", function() {
//                 const index = this.getAttribute("data-index");
//                 updateQuantity(index, -1);
//             });
//         });
//     }

//     function removeFromCart(index) {
//         let cart = JSON.parse(localStorage.getItem("cart")) || [];
//         cart.splice(index, 1);
//         localStorage.setItem("cart", JSON.stringify(cart));
//         renderCart();
//     }

//     function updateQuantity(index, change) {
//         let cart = JSON.parse(localStorage.getItem("cart")) || [];
//         if (cart[index].quantity) {
//             cart[index].quantity += change;
//         } else {
//             cart[index].quantity = 1 + change;
//         }
//         if (cart[index].quantity < 1) cart[index].quantity = 1;
//         localStorage.setItem("cart", JSON.stringify(cart));
//         renderCart();
//     }

//     clearCartButton.addEventListener("click", function() {
//         localStorage.removeItem("cart");
//         renderCart();
//     });

//     applyDiscountButton.addEventListener("click", function() {
//         // Funcionalidad del descuento
//         alert("Código de descuento aplicado");
//     });

//     renderCart();
// });



function removeFromCart(product_id) {
    $.post('/remove_from_cart', {product_id: product_id}, function(response) {
        location.reload();  // Recarga la página para reflejar los cambios en el carrito
    });
}

function clearCart() {
    $.post('/clear_cart', {}, function(response) {
        location.reload();  // Recarga la página para mostrar el carrito vacío
    });
}

$(document).ready(function() {
    $('#clear-cart').click(function() {
        clearCart();
    });
});

