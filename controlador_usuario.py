from database.bd_goldenstore import obtener_conexion


def insertar_usuario(numeroDocumento, nombre, apellido, nombre_usuario, email,contrasenia,telefono,fecha_nacimiento, estado,tipo_Usuario, tipo_documento):
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        cursor.execute("INSERT INTO Usuario(numeroDocumento, nombres, apellidos, usuario, email,contraseña,telefono,fechaNacimiento, status, id_TipoDocumento, id_TipoUsuario) VALUES (%s,%s, %s, %s, %s, %s, %s, %s, %s, %s,%s)",
                       (numeroDocumento, nombre, apellido, nombre_usuario, email,contrasenia,telefono,fecha_nacimiento, estado, tipo_documento, tipo_Usuario))
    conexion.commit()
    conexion.close()


def obtener_usuarios():
    conexion = obtener_conexion()
    usuarios = []
    with conexion.cursor() as cursor:
        cursor.execute("SELECT id_Usuario,numeroDocumento, nombres, apellidos, usuario, email,contraseña,telefono,fechaNacimiento, fechaCreación, status, id_TipoDocumento, id_TipoUsuario  FROM Usuario")
        usuarios = cursor.fetchall()
    conexion.close()
    return usuarios


def eliminar_usuario(id):
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        cursor.execute("DELETE FROM Usuario WHERE id_Usuario = %s", (id,))
    conexion.commit()
    conexion.close()


def obtener_usuario_por_id(id):
    conexion = obtener_conexion()
    juego = None
    with conexion.cursor() as cursor:
        cursor.execute(
            "SELECT id_Usuario,numeroDocumento, nombres, apellidos, usuario, email,contraseña,telefono,fechaNacimiento, status, id_TipoDocumento, id_TipoUsuario  FROM Usuario WHERE id_Usuario = %s", (id,))
        juego = cursor.fetchone()
    conexion.close()
    return juego


def actualizar_usuario(numeroDocumento, nombre, apellido, nombre_usuario, email,contrasenia,telefono,fecha_nacimiento, estado,tipo_Usuario, tipo_documento, id):
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        cursor.execute("UPDATE Usuario SET numeroDocumento= %s, nombres = %s, apellidos= %s, usuario= %s, email= %s,contraseña= %s,telefono= %s,fechaNacimiento= %s,status= %s,id_TipoDocumento=%s, id_TipoUsuario=%s WHERE id_Usuario = %s",
                       (numeroDocumento, nombre, apellido, nombre_usuario, email,contrasenia,telefono,fecha_nacimiento,estado, tipo_documento, tipo_Usuario, id))
    conexion.commit()
    conexion.close()


def obtener_nombre_tipo_usuario():
    conexion = obtener_conexion()
    tipos_usuario = []
    with conexion.cursor() as cursor:
        cursor.execute("SELECT id_TipoUsuario, nomTipoUsuario FROM Tipo_Usuario")
        tipos_usuario = cursor.fetchall()
    conexion.close()
    return tipos_usuario


def obtener_nombre_tipo_documento():
    conexion = obtener_conexion()
    tipos_documento = []
    with conexion.cursor() as cursor:
        cursor.execute("SELECT id_TipoDocumento, nomTipoDocumento FROM Tipo_Documento")
        tipos_documento = cursor.fetchall()
    conexion.close()
    return tipos_documento

