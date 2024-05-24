document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();  // Evita el envío del formulario por defecto

    // Obtener valores de los campos de entrada
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    // Limpiar cualquier alerta previa
    var alertContainer = document.getElementById('alertContainer');
    alertContainer.innerHTML = '';

    // Validar las credenciales
    if (username === 'admin' && password === '123') {
        // Redirigir a /admin_home si las credenciales son correctas
        window.location.href = '/admin_home';
    } else {
        // Crear una nueva alerta de Bootstrap
        var alertDiv = document.createElement('div');
        alertDiv.className = 'alert alert-warning alert-dismissible fade show';
        alertDiv.role = 'alert';
        alertDiv.innerHTML = `
            <strong>Error!</strong> Usuario o contraseña incorrectos.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        `;
        // Insertar la alerta en el contenedor
        alertContainer.appendChild(alertDiv);
    }
});