# Modelo de clases

## Mesa
Atributos: id, numero, capacidad, estado
Métodos: ocupar(), liberar()

## Reserva
Atributos: id, mesa_id, cliente, fecha, hora, num_personas, estado
Métodos: confirmar(), cancelar()

## Producto
Atributos: id, nombre, descripcion, precio, categoria, disponible
Métodos: actualizarPrecio()

## Pedido
Atributos: id, mesa_id, fecha_hora, estado, total
Métodos: agregarLinea(), calcularTotal(), cerrar()

## LineaPedido
Atributos: id, pedido_id, producto_id, cantidad, precio_unitario, subtotal
Métodos: calcularSubtotal()

## Relaciones
- Mesa 1..* Reserva
- Mesa 1..* Pedido
- Pedido 1..* LineaPedido
- Producto 1..* LineaPedido
