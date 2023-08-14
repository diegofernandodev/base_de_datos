-- Schema mydb
CREATE SCHEMA IF NOT EXISTS mydb;
SET search_path TO mydb;

-- Table Caja_menor
CREATE TABLE IF NOT EXISTS Caja_menor (
  Nit INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Telefono VARCHAR(100) NOT NULL,
  Correo_Electronico VARCHAR(100) NOT NULL,
  PRIMARY KEY (Nit)
);

-- Table Empresa
CREATE TABLE IF NOT EXISTS Empresa (
  Id_Empresa SERIAL PRIMARY KEY,
  Nit INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Telefono VARCHAR(100) NOT NULL,
  Correo_Electronico VARCHAR(100) NOT NULL
);

-- Table Roles
CREATE TABLE IF NOT EXISTS Roles (
  Id_Empresa SERIAL PRIMARY KEY,
  Gerente VARCHAR(100) NOT NULL,
  Administrador VARCHAR(100),
  Colaborador VARCHAR(100)
);

-- Table Gerente
CREATE TABLE IF NOT EXISTS Gerente (
  Id_Gerente SERIAL PRIMARY KEY,
  Numero_Documento INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Telefono VARCHAR(100) NOT NULL,
  Correo_Electronico VARCHAR(100) NOT NULL
);

-- Table Administrador
CREATE TABLE IF NOT EXISTS Administrador (
  Id_Administrador SERIAL PRIMARY KEY,
  Numero_Documento INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Telefono VARCHAR(100) NOT NULL,
  Correo_Electronico VARCHAR(100) NOT NULL
);

-- Table Colaborador
CREATE TABLE IF NOT EXISTS Colaborador (
  Id_Colaborador SERIAL PRIMARY KEY,
  Numero_Documento INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Telefono VARCHAR(100) NOT NULL,
  Correo_Electronico VARCHAR(100) NOT NULL
);

-- Table Ingreso_Caja
CREATE TABLE IF NOT EXISTS Ingreso_Caja (
  Id_Ingreso_Caja SERIAL PRIMARY KEY,
  Documento INT NOT NULL,
  Valor_Ingreso INT NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Detalle VARCHAR(200) NOT NULL,
  Fecha DATE NOT NULL,
  Adjuntar_archivo VARCHAR(100)
);

-- Table Egreso_Caja
CREATE TABLE IF NOT EXISTS Egreso_Caja (
  Id_Egreso_Caja SERIAL PRIMARY KEY,
  Documento INT NOT NULL,
  Valor_Ingreso INT NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Detalle VARCHAR(200) NOT NULL,
  Fecha DATE NOT NULL,
  Adjuntar_archivo VARCHAR(100),
  Tipo_Egreso VARCHAR(100),
  Tipo_Documento VARCHAR(100)
);

-- Table Eventos
CREATE TABLE IF NOT EXISTS Eventos (
  Id_Evento SERIAL PRIMARY KEY,
  Fecha_evento DATE NOT NULL,
  Hora_Evento TIMESTAMP NOT NULL,
  Anticipacion TIMESTAMP NOT NULL,
  Detalle VARCHAR(200) NOT NULL,
  Es_Recurrente BOOLEAN NOT NULL
);

-- Table Solicitudes
CREATE TABLE IF NOT EXISTS Solicitudes (
  Id_Solicitud SERIAL PRIMARY KEY,
  Valor INT NOT NULL,
  Solicitante VARCHAR(100) NOT NULL,
  Detalle VARCHAR(200) NOT NULL,
  Fecha DATE NOT NULL,
  Solicitar_a VARCHAR(100) NOT NULL,
  Tipo_Solicitud VARCHAR(100) NOT NULL
);

-- Table Estado_Solicitud
CREATE TABLE IF NOT EXISTS Estado_Solicitud (
  Id_Estado_Solicitud SERIAL PRIMARY KEY,
  Pendiente VARCHAR(100) NOT NULL,
  Aprobado VARCHAR(100) NOT NULL,
  Rechazado VARCHAR(100) NOT NULL
);

-- Table Notificaciones
CREATE TABLE IF NOT EXISTS Notificaciones (
  Id_Notificaciones SERIAL PRIMARY KEY,
  Descripcion VARCHAR(100) NOT NULL,
  Url_notificacion VARCHAR(100) NOT NULL,
  Fecha DATE NOT NULL,
  Estado VARCHAR(100) NOT NULL
);
