1. ¿Por qué cada clase tiene un id propio en vez de identificarse por sus otros atributos?

Porque los demás atributos pueden repetirse o cambiar (dos mesas podrían tener la misma capacidad, un cliente puede hacer varias reservas), pero necesitas una forma única e inmutable de referirte a cada fila. Es el equivalente a la clave primaria en la base de datos — de hecho, cada id del diagrama se traduce directamente en el PRIMARY KEY del schema.sql.

2. ¿Por qué Reserva y Pedido guardan mesaId en vez de guardar el objeto Mesa completo?

Dos razones:

Evitar duplicación de datos: si guardaras una copia entera de Mesa dentro de cada Reserva, y luego cambia el estado de esa mesa, tendrías que actualizarlo en todos los sitios donde la copiaste — fuente de errores.
Es como se traduce a SQL: una clase que "tiene un" mesaId (un número) se convierte directamente en una columna con FOREIGN KEY REFERENCES Mesa(id_mesa). Si guardaras el objeto completo, no sabrías cómo representarlo en una tabla relacional.
3. ¿Por qué LineaPedido guarda su propio precioUnitario, en vez de leerlo siempre de Producto.precio?

Esta es la decisión más importante a defender. Imagina que vendes una Paella a 12,50€ hoy, y el mes que viene subes el precio a 14€. Si LineaPedido no guardara su propio precio y solo consultara Producto.precio en tiempo real, el pedido de hace un mes cambiaría solo, mostrando 14€ en vez de los 12,50€ que realmente se cobraron. Eso rompería cualquier factura o informe histórico. Por eso el precio se "congela" en el momento de la venta, dentro de LineaPedido.

4. ¿Por qué la relación Pedido–LineaPedido es composición y no una asociación normal?

La diferencia clave: una LineaPedido no tiene sentido por sí sola. No existe el concepto de "una línea de pedido suelta, sin pedido" — si borras el pedido, sus líneas deben desaparecer con él. Eso es exactamente lo que representa el diamante relleno en UML (composición): "la parte no puede existir sin el todo".

En cambio, Mesa–Reserva es una asociación normal (sin diamante), porque conceptualmente podrías imaginar un sistema donde una reserva se consulta o se archiva independientemente de si la mesa sigue existiendo.

5. ¿Por qué el cálculo del total NO se repite en varias clases?

LineaPedido.calcularSubtotal() es el único lugar donde se multiplica cantidad × precioUnitario.
Pedido.calcularTotal() no repite esa fórmula — simplemente suma los subtotales ya calculados de sus líneas.

Esto sigue un principio de diseño llamado "single source of truth" (una única fuente de verdad): si mañana cambias la fórmula del subtotal (por ejemplo, para añadir descuentos por cantidad), solo tocas un sitio del código. Si hubieras copiado la fórmula en las dos clases, tendrías que acordarte de cambiarla en ambas — y es fácil olvidarse de una.

6. ¿Por qué la relación con Producto es de asociación simple, no de composición?

Porque un Producto sí puede existir independientemente de si está en algún pedido — de hecho, existe en el menú antes de que nadie lo pida, y sigue existiendo después de que el pedido se cierre o incluso se borre. Es lo opuesto al caso de LineaPedido: aquí ninguna de las dos clases "es dueña" de la existencia de la otra.

7. ¿Por qué los métodos son pocos y solo los "principales"?

El diagrama no pretende ser el código completo, sino mostrar el comportamiento esencial de cada clase — sus responsabilidades. Por ejemplo, Mesa puede ocupar() y liberar() porque esas son las dos transiciones de estado que le dan sentido a esa clase en el negocio (un restaurante). No se incluyen getters/setters triviales (como getNombre()) porque no aportan información de diseño — se dan por hecho en cualquier lenguaje orientado a objetos.