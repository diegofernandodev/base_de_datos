-- scripts para insertar datos a tablas
-- Insertar los roles
INSERT INTO Roles (Nombre_Rol) VALUES
('Usuario Principal'),
('Administrador'),
('Colaborador');

-- Insertar las categorías
INSERT INTO Categorias (Nombre) VALUES
    ('Papelería'),
    ('Transporte'),
    ('Cafetería'),
    ('Domicilio'),
    ('Otros');

-- Insertar los estados
INSERT INTO Estados (Nombre) VALUES
    ('Solicitado'),
    ('Entregado'),
    ('Terminado'),
    ('Denegado');
    
-- Insertar tipos de documento
INSERT INTO Tipos_Documento (Nombre_Documento) VALUES
    ('Cédula de Ciudadanía'),
    ('NIT'),
    ('Pasaporte'),
    ('Cédula de Extranjería');
    
-- Insertar regímenes de tributación
INSERT INTO Regimen_Tributacion (Nombre_Regimen) VALUES
    ('Simplificado'),
    ('Común'),
    ('Especial');
    
-- Insertar usuarios
INSERT INTO Usuarios (Tipo_Documento, Numero_Documento, Nombre, Apellidos, Telefono, Direccion, Email, Nombre_Usuario, Contraseña, Id_Rol_Fk) VALUES
    (CC, '123456789', 'Juan', 'Pérez', '1234567890', 'Calle 123', 'juan@email.com', 'juanito', 'hashed_password', 1),
    (NIT, '987654321', 'Ana', 'López', '9876543210', 'Avenida 456', 'ana@email.com', 'anita', 'hashed_password', 2),
    (NIT, '456789012', 'Carlos', 'Gómez', '4567890120', 'Carrera 789', 'carlos@email.com', 'carlitos', 'hashed_password', 3);

-- Insertar terceros 
INSERT INTO Terceros (Tipo_Documento, Numero_Documento, Nombre, Apellido, Razon_Social, Id_Regimen_Fk, Direccion, Telefono, Email) VALUES
    (NIT, '112233446', 'Empresa LMN', NULL, 'LMN S.A.', 2, 'Calle Nueva', '5552345678', 'contacto@lmn.com'),
    (NIT, '223344556', 'Proveedor ABC', NULL, 'ABC Ltda.', 1, 'Avenida Principal', '5553456789', 'contacto@proveedorabc.com'),
    (NIT, '334455667', 'Empresa XYZ', NULL, 'XYZ S.A.', 2, 'Carrera Central', '5554567890', 'contacto@xyzsa.com'),
    (NIT, '112233445', 'Empresa ABC', NULL, 'ABC Ltda.', 2, 'Calle Principal', '5551234567', 'contacto@abc.com'),
    (NIT, '998877665', 'Proveedor XYZ', NULL, 'XYZ S.A.', 1, 'Avenida Central', '5559876543', 'contacto@xyz.com');
    
-- Insertar Tipo_Registros
INSERT INTO Tipo_Registro (nombre) VALUES ('Ingreso'),('Egreso');
    
-- Insertar registros con diferentes categorías
INSERT INTO Registros (Descripcion, Id_Categoria_Fk, Id_Tipo_Registro_Fk, Doc_Soporte, Id_Usuario_Fk, Id_Tercero_Fk) VALUES
    ('Compra de papelería para oficina', 1, 2, NULL, 1, 2),
    ('Gasto de transporte para reunión', 2, 2, NULL, 2, NULL),
    ('Compra de café y refrescos', 3, 2, NULL, 1, NULL),
    ('Pago a mensajero', 4, 2, NULL, 2, 3),
    ('Otros gastos varios', 5, 2, NULL, 3, NULL);
    
INSERT INTO Movimiento_Solicitudes (fecha_hora, Id_Estado_Fk, Valor_Movimiento, Id_Registro_Fk) VALUES
    ('2023-01-15 09:30:00', 1, 50000, 1), -- Solicitud de compra de papelería (Solicitado)
    ('2023-01-15 09:45:00', 2, 50000, 1), -- Cambio a Entregado
    ('2023-01-15 10:15:00', 3, 50000, 1), -- Cambio a Terminado

    ('2023-02-10 08:25:00', 1, 25000, 2), -- Solicitud de gasto de transporte (Solicitado)
    ('2023-02-10 08:38:00', 2, 25000, 2), -- Cambio a Entregado
    ('2023-02-10 11:20:00', 3, 25000, 2), -- Cambio a Terminado
    
    ('2023-03-05 17:30:00', 4, 7500, 3); -- Solicitud de compra de café y refrescos (Denegado)
    
-- Inserts para la tabla Eventos
INSERT INTO Eventos (Titulo, Fecha_Inicio, Fecha_Final, Descripcion, Ubicacion, Url_Google_Calendar, Id_Usuario_Fk) VALUES
    ('Reunión de Equipo', '2023-06-15 09:00:00', '2023-06-15 11:00:00', 'Reunión semanal de equipo para discutir el progreso del proyecto.', 'Sala de Conferencias', 'https://calendar.google.com/event?id=abc123', 1),
    ('Presentación de Ventas', '2023-07-10 14:30:00', '2023-07-10 16:30:00', 'Presentación de ventas a clientes potenciales.', 'Salón de Ventas', 'https://calendar.google.com/event?id=xyz456', 2),
    ('Entrega de Suministros', '2023-08-05 11:00:00', '2023-08-05 12:30:00', 'Entrega de suministros de papelería a la oficina principal.', 'Oficina Principal', 'https://calendar.google.com/event?id=lmn789', 3);

-- Insertar datos en la tabla Empresas
INSERT INTO Empresas (Tipo_Documento, Numero_Documento, Nombre_Empresa, Direccion, Telefono, Email)
VALUES
  (1, '123456789', 'Empresa A', 'Dirección A', '1234567890', 'empresaA@example.com'),
  (2, '987654321', 'Empresa B', 'Dirección B', '9876543210', 'empresaB@example.com'),
  (3, '555555555', 'Empresa C', 'Dirección C', '5555555555', 'empresaC@example.com');

-- Insertar datos en la tabla Caja_Menor
INSERT INTO Caja_Menor (Nombre, Fecha, Valor_Inicial, Valor_Total, Id_Empresa_Fk)
VALUES
  ('Caja Empresa A', '2023-09-15', 1000, 1000, 1),
  ('Caja Empresa B', '2023-09-15', 1500, 1500, 2),
  ('Caja Empresa C', '2023-09-15', 2000, 2000, 3);
