-- Creación de la tabla CATEGORIA
CREATE TABLE CATEGORIA (
    id_Categoria INT(11) AUTO_INCREMENT PRIMARY KEY,
    nombreCategoria VARCHAR(255)
);

-- Creación de la tabla PRODUCTO
CREATE TABLE PRODUCTO (
    id_Producto BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    SKU VARCHAR(100),
    imagen LONGBLOB,
    nombreProducto VARCHAR(45),
    descripcion VARCHAR(45),
    talla VARCHAR(10),
    precio DECIMAL(9, 2),
    descuento DECIMAL(9, 2),
    precioTotal DECIMAL(9, 2),
    estado TINYINT(3),
    cantidad INT DEFAULT 0,
    id_Categoria INT(11),
    FOREIGN KEY (id_Categoria) REFERENCES CATEGORIA(id_Categoria)
);

-- Creación de la tabla TIPO_USUARIO
CREATE TABLE TIPO_USUARIO (
    id_TipoUsuario BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    tipoUsuario VARCHAR(45)
);

-- Creación de la tabla INICIO_SESION
CREATE TABLE INICIO_SESION (
    id_Login BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(18),
    contraseña VARCHAR(18),
    id_TipoUsuario BIGINT(20),
    FOREIGN KEY (id_TipoUsuario) REFERENCES TIPO_USUARIO(id_TipoUsuario)
);

-- Creación de la tabla TIPO_DOCUMENTO
CREATE TABLE TIPO_DOCUMENTO (
    id_TipoDocumento BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    tipoDocumento CHAR(1)
);

-- Creación de la tabla USUARIO
CREATE TABLE USUARIO (
    id_Usuario BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    nombreUsuario VARCHAR(10),
    correo VARCHAR(255),
    contraseña VARCHAR(8),
    telefono CHAR(9),
    fechaNacimiento DATE,
    fechaCreacion DATETIME,
    estado TINYINT(3),
    id_TipoUsuario BIGINT(20),
    id_TipoDocumento BIGINT(20),
    FOREIGN KEY (id_TipoUsuario) REFERENCES TIPO_USUARIO(id_TipoUsuario),
    FOREIGN KEY (id_TipoDocumento) REFERENCES TIPO_DOCUMENTO(id_TipoDocumento)
);

-- Creación de la tabla DIRECCION
CREATE TABLE DIRECCION (
    id_Direccion BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(100),
    departamento VARCHAR(100),
    ciudad VARCHAR(100),
    codigoPostal VARCHAR(100),
    direccion VARCHAR(100),
    direccion2 VARCHAR(100),
    referencia VARCHAR(100),
    id_Usuario BIGINT(20),
    FOREIGN KEY (id_Usuario) REFERENCES USUARIO(id_Usuario)
);

-- Creación de la tabla USUARIO_BANCO
CREATE TABLE USUARIO_BANCO (
    id_UsuarioBanco BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    numeroTarjeta INT(11),
    mesExpiracion DATE,
    añoExpiracion DATE,
    cvv CHAR(3),
    tipoCuenta VARCHAR(255),
    estado TINYINT(3),
    id_Usuario BIGINT(20),
    FOREIGN KEY (id_Usuario) REFERENCES USUARIO(id_Usuario)
);

-- Creación de la tabla PAGO
CREATE TABLE PAGO (
    id_Pago BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    fechaPago DATE,
    metodoPago VARCHAR(50),
    monto DECIMAL(9, 2),
    id_UsuarioBanco BIGINT(20),
    FOREIGN KEY (id_UsuarioBanco) REFERENCES USUARIO_BANCO(id_UsuarioBanco)
);

-- Creación de la tabla PEDIDO
CREATE TABLE PEDIDO (
    id_Pedido BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255),
    fechaPedido DATE,
    precioTotal DECIMAL(9, 2),
    subtotal DECIMAL(9, 2),
    descuento DECIMAL(9, 2),
    igv DECIMAL(9, 2),
    estado TINYINT(3),
    id_Usuario BIGINT(20),
    FOREIGN KEY (id_Usuario) REFERENCES USUARIO(id_Usuario)
);

-- Creación de la tabla DETALLE_PEDIDO
CREATE TABLE DETALLE_PEDIDO (
    id_DetallePedido BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    id_Pago BIGINT(20),
    id_Pedido BIGINT(20),
    estado TINYINT(3),
    FOREIGN KEY (id_Pago) REFERENCES PAGO(id_Pago),
    FOREIGN KEY (id_Pedido) REFERENCES PEDIDO(id_Pedido)
);

-- Insertando datos en TIPO_USUARIO
INSERT INTO TIPO_USUARIO (tipoUsuario) VALUES 
('Admin'), 
('Cliente');

-- Insertando datos en INICIO_SESION
INSERT INTO INICIO_SESION (nombreUsuario, contraseña, id_TipoUsuario) VALUES 
('admin01', 'pass01', 1), 
('cliente01', 'pass02', 2);

-- Insertando datos en TIPO_DOCUMENTO
INSERT INTO TIPO_DOCUMENTO (tipoDocumento) VALUES 
('D'), 
('P');

-- Insertando datos en USUARIO
INSERT INTO USUARIO (nombre, apellido, nombreUsuario, correo, contraseña, telefono, fechaNacimiento, fechaCreacion, estado, id_TipoUsuario, id_TipoDocumento) VALUES 
('Juan', 'Pérez', 'juanp', 'juan.perez@example.com', 'jp1234', '987654321', '1990-01-01', NOW(), 1, 1, 1),
('María', 'López', 'marial', 'maria.lopez@example.com', 'ml5678', '987654322', '1992-02-02', NOW(), 1, 2, 2);

-- Insertando datos en DIRECCION
INSERT INTO DIRECCION (pais, departamento, ciudad, codigoPostal, direccion, direccion2, referencia, id_Usuario) VALUES 
('Perú', 'Lima', 'Lima', '15001', 'Av. Siempre Viva 123', 'Dpto. 301', 'Cerca al supermercado', 1);

-- Insertando datos en USUARIO_BANCO
INSERT INTO USUARIO_BANCO (numeroTarjeta, mesExpiracion, añoExpiracion, cvv, tipoCuenta, estado, id_Usuario) VALUES 
(1234567890123456, '2024-12-01', '2024-12-01', '123', 'Débito', 1, 1);

-- Insertando datos en PAGO
INSERT INTO PAGO (fechaPago, metodoPago, monto, id_UsuarioBanco) VALUES 
('2024-05-01', 'Tarjeta de crédito', 100.00, 1);

-- Insertando datos en PEDIDO
INSERT INTO PEDIDO (descripcion, fechaPedido, precioTotal, subtotal, descuento, igv, estado, id_Usuario) VALUES 
('Pedido inicial', '2024-05-01', 115.00, 100.00, 0.00, 15.00, 1, 1);

-- Insertando datos en DETALLE_PEDIDO
INSERT INTO DETALLE_PEDIDO (id_Pago, id_Pedido, estado) VALUES 
(1, 1, 1);

-- Insertando datos en CATEGORIA
INSERT INTO CATEGORIA (nombreCategoria) VALUES 
('Ropa');

-- Insertando datos en PRODUCTO
INSERT INTO PRODUCTO (SKU, imagen, nombreProducto, descripcion, talla, precio, descuento, precioTotal, estado, cantidad, id_Categoria) VALUES 
('SKU123', NULL, 'Camiseta Azul', 'Camiseta de algodón azul', 'M', 20.00, 2.00, 18.00, 1, 100, 1);