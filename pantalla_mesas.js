// Pantalla de gestion de mesas
// Muestra el estado de cada mesa: libre, ocupada o reservada

function cargarMesas() {
    console.log("Cargando listado de mesas...");
    return fetch('/api/mesas');
}

function mostrarEstado(mesa) {
    return `Mesa ${mesa.numero}: ${mesa.estado}`;
}
