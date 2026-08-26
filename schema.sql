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
