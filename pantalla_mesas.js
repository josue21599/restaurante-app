// Pantalla de gestion de mesas
// Version simplificada, sin logs de carga

function cargarMesas() {
    return fetch('/api/mesas');
}

function mostrarEstado(mesa) {
    return mesa.numero + ' - ' + mesa.estado.toUpperCase();
}
