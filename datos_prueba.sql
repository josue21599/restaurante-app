-- Datos de prueba para comprobar integridad referencial
-- Orden de insercion: Mesa, Producto -> Reserva, Pedido -> LineaPedido

-- 1. Mesa (no depende de nadie)
INSERT INTO Mesa (numero, capacidad, estado) VALUES
(1, 4, 'libre'),
(2, 2, 'libre'),
(3, 6, 'reservada');

-- 2. Reserva (depende de Mesa)
INSERT INTO Reserva (id_mesa, nombre_cliente, fecha, hora, num_personas, estado) VALUES
(3, 'Ana Garcia', '2026-08-30', '21:00:00', 5, 'confirmada'),
(1, 'Luis Perez', '2026-08-31', '14:00:00', 3, 'pendiente');

-- 3. Producto (no depende de nadie)
INSERT INTO Producto (nombre, descripcion, precio, categoria, disponible) VALUES
('Paella valenciana', 'Arroz con pollo y verduras', 12.50, 'Plato principal', TRUE),
('Ensalada Cesar', 'Lechuga, pollo, parmesano', 8.00, 'Entrante', TRUE),
('Tarta de queso', 'Postre casero', 4.50, 'Postre', TRUE);

-- 4. Pedido (depende de Mesa)
INSERT INTO Pedido (id_mesa, estado, total) VALUES
(1, 'abierto', 0);

-- 5. LineaPedido (depende de Pedido y de Producto)
INSERT INTO LineaPedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 12.50),
(1, 3, 1, 4.50);
