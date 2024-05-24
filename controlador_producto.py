from database.bd_goldenstore import obtener_conexion

def insertar_producto(ruta_imagen_db, nombreProducto, descripcion, talla, monto,descuento,monto_total,status, id_Categoria):
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        cursor.execute("INSERT INTO producto(imagen, nombreProducto, descripcion, talla, monto, descuento,monto_total,status,id_Categoria) VALUES (%s,%s,%s, %s, %s, %s, %s, %s, %s)",
                       (ruta_imagen_db, nombreProducto, descripcion, talla, monto,descuento,monto_total,status, id_Categoria))
    conexion.commit()
    conexion.close()

def obtener_nombre_categoria():
    conexion = obtener_conexion()
    tipos_documento = []
    with conexion.cursor() as cursor:
        cursor.execute("SELECT id_Categoria, nombreCategoria FROM Categoria")
        tipos_documento = cursor.fetchall()
    conexion.close()
    return tipos_documento


def obtener_producto():
    conexion = obtener_conexion()
    usuarios = []
    with conexion.cursor() as cursor:
        cursor.execute("SELECT id_Producto, nombreProducto, descripcion, talla, monto, descuento,monto_total,status,id_Categoria  FROM Producto")
        usuarios = cursor.fetchall()
    conexion.close()
    return usuarios

def eliminar_producto(id):
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        cursor.execute("DELETE FROM Producto WHERE id_Producto = %s", (id,))
    conexion.commit()
    conexion.close()

def obtener_producto_por_id(id):
    conexion = obtener_conexion()
    juego = None
    with conexion.cursor() as cursor:
        cursor.execute(
            "SELECT id_Producto, imagen, nombreProducto, descripcion, talla, monto, descuento,monto_total,status,id_Categoria  FROM Producto WHERE id_Producto = %s", (id,))
        juego = cursor.fetchone()
    conexion.close()
    print(juego)
    return juego

def actualizar_producto(imagen, nombreProducto, descripcion, talla, monto,descuento,monto_total,status, id_Categoria, id):
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        cursor.execute("UPDATE Producto SET imagen= %s, nombreProducto = %s, descripcion= %s, talla= %s, monto= %s,descuento= %s,monto_total= %s,status= %s,id_Categoria = %s WHERE id_Producto = %s",
                       (imagen, nombreProducto, descripcion, talla, monto,descuento,monto_total,status, id_Categoria, id))
    conexion.commit()
    conexion.close()

# Función para obtener todos los productos y enviarlos a la plantilla hombre.html
def obtener_productos():
    conexion = obtener_conexion()
    productos = []
    with conexion.cursor() as cursor:
        cursor.execute("SELECT id_Producto, imagen, nombreProducto, descripcion, talla, monto, descuento, monto_total, status, id_Categoria FROM Producto")
        productos = cursor.fetchall()
    conexion.close()
    print(productos)
    return productos

# Función para obtener un producto por su id
def obtener_producto_por_id(id):
    conexion = obtener_conexion()
    producto = None
    with conexion.cursor() as cursor:
        cursor.execute("SELECT id_Producto, imagen, nombreProducto, descripcion, talla, monto, descuento, monto_total, status, id_Categoria FROM Producto WHERE id_Producto = %s", (id,))
        producto = cursor.fetchone()
    conexion.close()
    return producto