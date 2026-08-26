// Pantalla de gestión de mesas
// Muestra el estado de cada mesa: libre, ocupada o reservada

function cargarMesas() {
    console.log("Cargando listado de mesas...");
}

function mostrarEstado(mesa) {
    return `Mesa ${mesa.numero}: ${mesa.estado}`;
}
