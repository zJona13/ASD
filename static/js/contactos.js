function enviarFormulario() {
    var nombre = document.getElementById('nombreInput').value;
    var correo = document.getElementById('correoInput').value;
    var telefono = document.getElementById('telefonoInput').value;
    var asunto = document.getElementById('asuntoInput').value;
    var mensaje = document.getElementById('mensajeInput').value;
    var aceptaTerminos = document.getElementById('flexCheckDefault').checked;

    if (nombre && correo && telefono && asunto && mensaje && aceptaTerminos) {
        alert("Envío exitoso");

        // Limpiar los campos del formulario
        document.getElementById('nombreInput').value = '';
        document.getElementById('correoInput').value = '';
        document.getElementById('telefonoInput').value = '';
        document.getElementById('asuntoInput').value = '';
        document.getElementById('mensajeInput').value = '';
        document.getElementById('flexCheckDefault').checked = false;
    } else {
        alert("Por favor, completa todos los campos antes de enviar el formulario.");
    }
}