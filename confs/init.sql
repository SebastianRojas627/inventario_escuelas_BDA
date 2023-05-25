USE inventario_escuelas;

CREATE TABLE Tipos_Unidades (
  ID_Tipo INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Descripcion VARCHAR(255)
);

INSERT INTO Tipos_Unidades (ID_Tipo, Nombre, Descripcion)
VALUES (1, 'Tipo 1', 'Descripción 1'),
       (2, 'Tipo 2', 'Descripción 2'),
       (3, 'Tipo 3', 'Descripción 3');

CREATE TABLE Provincias (
  ID_Provincia INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Descripcion VARCHAR(255)
);

INSERT INTO Provincias (ID_Provincia, Nombre, Descripcion)
VALUES (1, 'Provincia 1', 'Descripción 1'),
       (2, 'Provincia 2', 'Descripción 2'),
       (3, 'Provincia 3', 'Descripción 3');

CREATE TABLE Productos (
  ID_Producto INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Descripcion VARCHAR(255)
);

INSERT INTO Productos (ID_Producto, Nombre, Descripcion)
VALUES (1, 'Producto 1', 'Descripción 1'),
       (2, 'Producto 2', 'Descripción 2'),
       (3, 'Producto 3', 'Descripción 3');

CREATE TABLE Localidades (
  ID_Localidad INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Descripcion VARCHAR(255),
  ID_Provincia INT,
  FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia)
);

INSERT INTO Localidades (ID_Localidad, Nombre, Descripcion, ID_Provincia)
VALUES (1, 'Localidad 1', 'Descripción 1', 1),
       (2, 'Localidad 2', 'Descripción 2', 2),
       (3, 'Localidad 3', 'Descripción 3', 3);

CREATE TABLE Proveedores (
  ID_Proveedor INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Direccion VARCHAR(255)
);

INSERT INTO Proveedores (ID_Proveedor, Nombre, Direccion)
VALUES (1, 'Proveedor 1', 'Dirección 1'),
       (2, 'Proveedor 2', 'Dirección 2'),
       (3, 'Proveedor 3', 'Dirección 3');

CREATE TABLE Unidades_Educativas (
  ID_Unidad INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Direccion VARCHAR(255),
  ID_Tipo INT,
  ID_Localidad INT,
  FOREIGN KEY (ID_Tipo) REFERENCES Tipos_Unidades(ID_Tipo),
  FOREIGN KEY (ID_Localidad) REFERENCES Localidades(ID_Localidad)
);

INSERT INTO Unidades_Educativas (ID_Unidad, Nombre, Direccion, ID_Tipo, ID_Localidad)
VALUES (1, 'Unidad Educativa A', 'Dirección A', 1, 1),
       (2, 'Unidad Educativa B', 'Dirección B', 1, 2),
       (3, 'Unidad Educativa C', 'Dirección C', 2, 3);

CREATE TABLE Coordenadas_GPS (
  ID_Coordenadas INT PRIMARY KEY,
  ID_Unidad INT,
  Latitud DECIMAL(9,6),
  Longitud DECIMAL(9,6),
  FOREIGN KEY (ID_Unidad) REFERENCES Unidades_Educativas(ID_Unidad)
);

INSERT INTO Coordenadas_GPS (ID_Coordenadas, ID_Unidad, Latitud, Longitud)
VALUES (1, 1, 12.345678, -45.678901),
       (2, 2, 23.456789, -56.789012),
       (3, 3, 34.567890, -67.890123);

CREATE TABLE Suministro (
  ID_Suministro INT PRIMARY KEY,
  ID_Proveedor INT,
  ID_Producto INT,
  ID_Unidad INT,
  Cantidad INT,
  FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor),
  FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
  FOREIGN KEY (ID_Unidad) REFERENCES Unidades_Educativas(ID_Unidad)
);

INSERT INTO Suministro (ID_Suministro, ID_Proveedor, ID_Producto, ID_Unidad, Cantidad)
VALUES (1, 1, 1, 1, 5),
       (2, 2, 2, 2, 10),
       (3, 3, 3, 3, 15);

CREATE TABLE Inventario (
  ID_Inventario INT PRIMARY KEY,
  ID_Unidad INT,
  ID_Producto INT,
  Cantidad INT,
  FOREIGN KEY (ID_Unidad) REFERENCES Unidades_Educativas(ID_Unidad),
  FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

INSERT INTO Inventario (ID_Inventario, ID_Unidad, ID_Producto, Cantidad)
VALUES (1, 1, 1, 10),
       (2, 2, 2, 20),
       (3, 3, 3, 30);
