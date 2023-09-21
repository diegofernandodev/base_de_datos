-- SCRIPT PARA CREAR BASE DE DATOS Y TABLAS
CREATE DATABASE LITTLE_BOX_PRO;
USE LITTLE_BOX_PRO;

-- Tabla tipos de documentos
CREATE TABLE Tipos_Documento (
  Id_Documento INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Documento VARCHAR(200) NOT NULL
);

-- Tabla regimenes de tributación
CREATE TABLE Regimen_Tributacion (
  Id_Regimen INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Regimen VARCHAR(200) NOT NULL
);

-- Tabla Empresas
CREATE TABLE Empresas (
  Id_Empresa INT AUTO_INCREMENT PRIMARY KEY,
  Id_Tipo_Doc_Fk INT NOT NULL,
  Numero_Documento VARCHAR(200) NOT NULL,
  Nombre_Empresa VARCHAR(200) NOT NULL,
  Direccion VARCHAR(200) NOT NULL,
  Telefono VARCHAR(200) NOT NULL,
  Email VARCHAR(200) NOT NULL,
  FOREIGN KEY (Id_Tipo_Doc_Fk) REFERENCES Tipos_Documento(Id_Documento)
);

-- Tabla roles
CREATE TABLE Roles (
    Id_Rol INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Rol VARCHAR(200) NOT NULL
);

-- Tabla usuarios
CREATE TABLE Usuarios (
    Id_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Documento_Fk INT NOT NULL,
    Numero_Documento VARCHAR(200) NOT NULL,
    Nombre VARCHAR(200) NOT NULL,
    Apellidos VARCHAR(200) NOT NULL,
    Telefono VARCHAR(200),
    Direccion VARCHAR(200),
    Email VARCHAR(200),
    Nombre_Usuario VARCHAR(200),
    Contraseña VARCHAR(200),
    Id_Rol_Fk INT,
    FOREIGN KEY (Tipo_Documento_Fk) REFERENCES Tipos_Documento(Id_Documento),
    FOREIGN KEY (Id_Rol_Fk) REFERENCES Roles(Id_Rol)
);

-- Tabla terceros
CREATE TABLE Terceros (
    Id_Tercero INT AUTO_INCREMENT PRIMARY KEY,
    Id_Tipo_Doc_Fk INT,
    Numero_Documento VARCHAR(200),
    Nombre VARCHAR(200),
    Apellido VARCHAR(200),
    Razon_Social VARCHAR(200),
    Id_Regimen_Fk INT,
    Direccion VARCHAR(200),
    Telefono VARCHAR(200),
    Email VARCHAR(200),
    FOREIGN KEY (Id_Tipo_Doc_Fk) REFERENCES Tipos_Documento(Id_Documento),
    FOREIGN KEY (Id_Regimen_Fk) REFERENCES Regimen_Tributacion(Id_Regimen)
);

-- Tabla categorías
CREATE TABLE Categorias (
    Id_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(200) NOT NULL
);

-- Tabla estados
CREATE TABLE Estados (
    Id_Estado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(200) NOT NULL
);

-- Tabla Tipo_Registro
CREATE TABLE Tipo_Registro (
    Id_Tipo_Registro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200)
);

-- Tabla registros
CREATE TABLE Registros (
    Id_Registro INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(500),
    Id_Categoria_Fk INT,
    Id_Tipo_Registro_Fk INT,
    Doc_Soporte LONGBLOB,
    Id_Usuario_Fk INT,
    Id_Tercero_Fk INT,
    FOREIGN KEY (Id_Categoria_Fk) REFERENCES Categorias(Id_Categoria),
    FOREIGN KEY (Id_Tipo_Registro_Fk) REFERENCES Tipo_Registro(Id_Tipo_Registro),
    FOREIGN KEY (Id_Usuario_Fk) REFERENCES Usuarios(Id_Usuario),
    FOREIGN KEY (Id_Tercero_Fk) REFERENCES Terceros(Id_Tercero)
);

-- Tabla movimiento_solicitudes
CREATE TABLE Movimiento_Solicitudes (
    Id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME,
    Id_Estado_Fk INT,
    Valor_Movimiento INT,
    Id_Registro_Fk INT,
    FOREIGN KEY (Id_Estado_Fk) REFERENCES Estados(Id_Estado),
    FOREIGN KEY (Id_Registro_Fk) REFERENCES Registros(Id_Registro)
);

-- Tabla Caja_Menor
CREATE TABLE Caja_Menor (
    Id_Caja_Menor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(200) NOT NULL,
    Fecha DATE,
    Valor_Inicial INT NOT NULL,
    Valor_Total INT NOT NULL,
    Id_Empresa_Fk INT,
    FOREIGN KEY (Id_Empresa_Fk) REFERENCES Empresas(Id_Empresa)
);

-- Tabla eventos
CREATE TABLE Eventos (
    Id_Evento INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(200) NOT NULL,
    Fecha_Inicio DATETIME NOT NULL,
    Fecha_Final DATETIME NOT NULL,
    Descripcion VARCHAR(500),
    Ubicacion VARCHAR(200),
    Url_Google_Calendar VARCHAR(200),
    Id_Usuario_Fk INT,
    FOREIGN KEY (Id_Usuario_Fk) REFERENCES Usuarios(Id_Usuario)
);
