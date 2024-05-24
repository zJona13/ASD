from flask import Flask, render_template, request, redirect, flash, jsonify, session, url_for
from werkzeug.utils import secure_filename
import os
import controlador_producto
import controlador_usuario

app = Flask(__name__)

app.secret_key = 'mysecretkey'

###### RUTAS USUARIO #####

@app.route('/')
@app.route('/index')
def index():
    if 'cart' not in session:
        session['cart'] = {}
    return render_template('index.html')



@app.route('/mujer')
def mujer():
    return render_template('mujer.html')


@app.route('/carro_compra')
def carro_compra():
    return render_template('carro_compra.html')


@app.route('/acercade')
def acercade():
    return render_template('acerca_De.html')


@app.route('/contactos')
def contactos():
    return render_template('contactos.html')


@app.route('/hombre')
def hombre():
    productos = controlador_producto.obtener_productos()
    return render_template('hombre.html', productos=productos)





@app.route('/registrarse')
def registrarse():
    return render_template('registrarse.html')


###### LEGALES #####


@app.route('/base_legales')
def base_legales():
    return render_template('datos_legales/base_legales.html')


@app.route('/cambios_devoluciones')
def cambios_devoluciones():
    return render_template('datos_legales/cambios_devoluciones.html')


@app.route('/politica_privacidad')
def politica_privacidad():
    return render_template('datos_legales/politica_privacidad.html')


@app.route('/preguntas_frecuentes')
def preguntas_frecuentes():
    return render_template('datos_legales/preguntas_frecuentes.html')


@app.route('/terminos_condiciones')
def terminos_condiciones():
    return render_template('datos_legales/terminos_condiciones.html')


###### RUTAS ADMINISTRADOR #####


@app.route('/admin_home')
def admin_home():
    return render_template('administrador/admin_home.html')


#Rutas para agregar, editar, actualizar, eliminar USUARIO


@app.route("/usuarios")
def usuarios():
    usuarios = controlador_usuario.obtener_usuarios()
    return render_template("administrador/usuarios.html", usuarios=usuarios)


@app.route("/agregar_usuario")
def formulario_agregar_usuario():
    tipos_usuario = controlador_usuario.obtener_nombre_tipo_usuario()
    tipos_documento = controlador_usuario.obtener_nombre_tipo_documento()
    print(tipos_documento)
    print(tipos_usuario)
    return render_template("administrador/agregar_usuario.html", tipos_usuario=tipos_usuario, tipos_documento=tipos_documento)


@app.route("/guardar_usuario", methods=["POST"])
def guardar_usuario():
    numeroDocumento= request.form["numeroDocumento"]
    nombre= request.form["nombres"]
    apellido = request.form["apellidos"]
    nombre_usuario = request.form["usuario"]
    email = request.form["email"]
    contrasenia = request.form["contraseña"]
    telefono = request.form["telefono"]
    fecha_nacimiento = request.form["fechaNacimiento"]
    estado = request.form["status"]
    tipo_usuario = request.form["id_TipoUsuario"]
    tipo_documento = request.form["id_TipoDocumento"]
    controlador_usuario.insertar_usuario(numeroDocumento, nombre, apellido, nombre_usuario, email,contrasenia,telefono,fecha_nacimiento, estado,tipo_usuario, tipo_documento)
    # De cualquier modo, y si todo fue bien, redireccionar
    return redirect("/usuarios")


@app.route("/eliminar_usuario", methods=["POST"])
def eliminar_usuario():
    controlador_usuario.eliminar_usuario(request.form["id"])
    return redirect("/usuarios")


@app.route("/formulario_editar_usuario/<int:id>")
def editar_usuario(id):
    # Obtener el usuario por ID
    tipos_usuario = controlador_usuario.obtener_nombre_tipo_usuario()
    tipos_documento = controlador_usuario.obtener_nombre_tipo_documento()
    usuario = controlador_usuario.obtener_usuario_por_id(id)
    return render_template("administrador/editar_usuarios.html", usuario=usuario, tipos_usuario=tipos_usuario, tipos_documento=tipos_documento)


@app.route("/actualizar_usuario", methods=["POST"])
def actualizar_usuario():
    numeroDocumento= request.form["numeroDocumento"]
    id = request.form["id"]
    nombre= request.form["nombres"]
    apellido = request.form["apellidos"]
    nombre_usuario = request.form["usuario"]
    email = request.form["email"]
    contrasenia = request.form["contraseña"]
    telefono = request.form["telefono"]
    fecha_nacimiento = request.form["fechaNacimiento"]
    estado = request.form["status"]
    tipo_usuario = request.form["id_TipoUsuario"]
    tipo_documento = request.form["id_TipoDocumento"]
    controlador_usuario.actualizar_usuario(numeroDocumento, nombre, apellido, nombre_usuario, email,contrasenia,telefono,fecha_nacimiento, estado,tipo_usuario, tipo_documento, id)
    return redirect("/usuarios")

#Rutas para agregar, editar, actualizar, eliminar PRODUCTO

@app.route("/productos")
def productos():
    productos = controlador_producto.obtener_producto()
    return render_template("administrador/producto.html", productos=productos)


@app.route("/agregar_producto")
def formulario_agregar_producto():
    categorias = controlador_producto.obtener_nombre_categoria()
    print(categorias)
    return render_template("administrador/agregar_producto.html", categorias=categorias)

from flask import request, redirect, url_for
from werkzeug.utils import secure_filename
import os

@app.route("/guardar_producto", methods=["POST"])
def guardar_producto():
    imagen = request.files.get('imagenes')  
    if imagen and imagen.filename: 
        nombre_imagen = secure_filename(imagen.filename)
        ruta_destino = os.path.join(app.root_path, 'static', 'assets' ,'img', 'productos', nombre_imagen)
        imagen.save(ruta_destino)
        ruta_imagen_db = os.path.join('img', 'productos', nombre_imagen).replace('\\', '/')  
    else:
        ruta_imagen_db = 'img/productos/default.jpg'  

    
    nombreProducto = request.form.get("nombreProducto", "")
    descripcion = request.form.get("descripcion", "")
    talla = request.form.get("talla", "")
    monto = request.form.get("monto", "0")
    descuento = request.form.get("descuento", "0")
    monto_total = request.form.get("monto_total", "0")
    status = request.form.get("status", "activo")  
    id_Categoria = request.form.get("id_Categoria", "1")  

    controlador_producto.insertar_producto(ruta_imagen_db, nombreProducto, descripcion, talla, monto, descuento, monto_total, status, id_Categoria)

    return redirect(url_for('productos'))



@app.route("/actualizar_producto", methods=["POST"])
def actualizar_producto():
    id = request.form["id"]
    imagen = request.form["imagen"]
    nombreProducto= request.form["nombreProducto"]
    descripcion = request.form["descripcion"]
    talla = request.form["talla"]
    monto = request.form["monto"]
    descuento = request.form["descuento"]
    monto_total = request.form["monto_total"]
    status = request.form["status"]
    id_Categoria = request.form["id_Categoria"]
    controlador_producto.actualizar_producto(imagen, nombreProducto, descripcion, talla,monto,descuento,monto_total, status,id_Categoria, id)
    return redirect("/productos")


@app.route("/eliminar_producto", methods=["POST"])
def eliminar_producto():
    controlador_producto.eliminar_producto(request.form["id"])
    return redirect("/productos")


@app.route("/formulario_editar_producto/<int:id>")
def editar_producto(id):
    # Obtener el usuario por ID
    producto = controlador_producto.obtener_producto_por_id(id)
    tipos_categorias = controlador_producto.obtener_nombre_categoria()
    return render_template("administrador/editar_producto.html", producto=producto, tipos_categorias = tipos_categorias)
@app.route('/producto_detalle/<int:id>')
def producto_detalle(id):
    producto = controlador_producto.obtener_producto_por_id(id)
    if not producto:
        flash('Producto no encontrado')
        return redirect('/productos')  
    return render_template('producto_detalle.html', producto=producto)



#PRUEBAS CARRITO 



@app.route('/remove_from_cart', methods=['POST'])
def remove_from_cart():
    product_id = request.form.get('product_id')
    if product_id in session.get('cart', {}):
        del session['cart'][product_id]
        session.modified = True
    return redirect(url_for('show_cart'))

@app.route('/clear_cart', methods=['POST'])
def clear_cart():
    session['cart'] = {}
    session.modified = True
    return redirect(url_for('show_cart'))



@app.route('/add_to_cart', methods=['POST'])
def add_to_cart():
    product_id = request.form.get('product_id')
    cantidad = int(request.form.get('cantidad', 1))  

    if 'cart' not in session:
        session['cart'] = {}

    if product_id in session['cart']:
        session['cart'][product_id]['cantidad'] += cantidad
    else:
        producto = controlador_producto.obtener_producto_por_id(int(product_id))
        if producto:
            session['cart'][product_id] = {
                'nombre': producto[2],
                'precio': float(producto[5]), 
                'cantidad': cantidad
            }

    session.modified = True
    return jsonify({'message': 'Producto añadido al carrito', 'cart': session['cart']})



@app.route('/cart')
def show_cart():
    cart = session.get('cart', {})  
    total = sum(float(item['precio']) * item['cantidad'] for item in cart.values()) if cart else 0
    return render_template('carrito-prueba.html', cart=cart, total=total)














if __name__ == '__main__':
    app.run(debug=True)
