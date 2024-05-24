from database.bd_goldenstore import obtener_conexion

conexion = obtener_conexion()

# hacer el detalle pedido

def insertar_transaccion(id_usuario, id_producto, cantidad, monto_total):
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        cursor.execute("INSERT INTO transaccion(id_usuario, id_producto, cantidad, monto_total) VALUES (%s, %s, %s, %s)",
                       (id_usuario, id_producto, cantidad, monto_total))
    conexion.commit()
    conexion.close()

def obtener_transacciones():
    conexion = obtener_conexion()
    transacciones = []
    with conexion.cursor() as cursor:
        cursor.execute("SELECT id_transaccion, id_usuario, id_producto, cantidad FROM transaccion")



