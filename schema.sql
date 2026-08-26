-- Esquema de base de datos del restaurante

CREATE TABLE Mesa (
    id_mesa      INT PRIMARY KEY AUTO_INCREMENT,
    numero       INT NOT NULL UNIQUE,
    capacidad    INT NOT NULL,
    estado       VARCHAR(20) NOT NULL DEFAULT 'libre'
);

CREATE TABLE Reserva (
    id_reserva     INT PRIMARY KEY AUTO_INCREMENT,
    id_mesa        INT NOT NULL,
    nombre_cliente VARCHAR(100) NOT NULL,
    fecha          DATE NOT NULL,
    hora           TIME NOT NULL,
    num_personas   INT NOT NULL,
    estado         VARCHAR(20) NOT NULL DEFAULT 'pendiente',
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa)
);

CREATE TABLE Producto (
    id_producto  INT PRIMARY KEY AUTO_INCREMENT,
    nombre       VARCHAR(100) NOT NULL,
    descripcion  VARCHAR(255),
    precio       DECIMAL(8,2) NOT NULL,
    categoria    VARCHAR(50),
    disponible   BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Pedido (
    id_pedido    INT PRIMARY KEY AUTO_INCREMENT,
    id_mesa      INT NOT NULL,
    fecha_hora   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado       VARCHAR(20) NOT NULL DEFAULT 'abierto',
    total        DECIMAL(10,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa)
);

CREATE TABLE LineaPedido (
    id_linea         INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido        INT NOT NULL,
    id_producto      INT NOT NULL,
    cantidad         INT NOT NULL CHECK (cantidad > 0),
    precio_unitario  DECIMAL(8,2) NOT NULL,
    subtotal         DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);
