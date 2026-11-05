--# outer-joins-ministore

--outer-joins-ministore/├── schema.sql
--├── soluciones.sql
--└── README.md

-- ══════════════════════════════════════════
-- MiniStore — Schema y datos de prueba
-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?

SELECT PR.Nombre, PR.categoria, PR.precio
FROM Productos AS PR
LEFT JOIN Ventas AS VTS
ON PR.producto_id = VTS.producto_id
WHERE VTS.venta_id IS NULL;



-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.

SELECT 
    PR.producto_id,
    PR.nombre, 
    PR.categoria, 
    PR.precio,
    VTS.venta_id,
    VTS.cantidad,
    VTS.fecha_venta
FROM productos AS PR
LEFT JOIN ventas AS VTS 
    ON PR.producto_id = VTS.producto_id;


    -- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.


SELECT 
    VTS.venta_id,
    VTS.fecha_venta,
    VTS.cantidad,
    VTS.producto_id AS id_en_ventas,
    PR.nombre       AS nombre_producto

FROM Productos    AS PR
RIGHT JOIN Ventas AS VTS
ON PR.producto_id = VTS.producto_id 

WHERE PR.producto_id IS NULL; 

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

SELECT 
    VTS.venta_id,
    VTS.producto_id,
    VTS.cliente_id,
    VTS.cantidad AS cantidad_venta,
    VTS.fecha_venta,

    PR.producto_id,
    PR.nombre    AS nombre_producto,
    PR.categoria AS categoria_producto,
    PR.precio    AS precio_producto
    
FROM ventas               AS VTS
FULL OUTER JOIN productos AS PR
ON PR.producto_id = VTS.producto_id

ORDER BY fecha_venta
