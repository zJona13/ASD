import pymysql

def obtener_conexion():
    return pymysql.connect(host='127.0.0.1',
                                user='root',
                                password='',
                                db='bd_golden_store')