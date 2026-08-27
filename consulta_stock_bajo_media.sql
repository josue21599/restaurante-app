-- Productos cuyo stock es inferior a la media de stock de su categoria
-- Subconsulta correlacionada: p2.categoria = p.categoria depende de la fila exterior (p)

SELECT nombre, categoria, stock
FROM Producto p
WHERE stock < (
    SELECT AVG(stock)
    FROM Producto p2
    WHERE p2.categoria = p.categoria
);
