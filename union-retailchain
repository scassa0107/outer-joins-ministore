-- ══════════════════════════════════════════
-- RetailChain — Inventario por Sucursal
-- ══════════════════════════════════════════

-- Paso 1: tablas y carga los datos --

DROP TABLE IF EXISTS inventario_sucursal_norte;
DROP TABLE IF EXISTS inventario_sucursal_sur;

CREATE TABLE inventario_sucursal_norte (
    id_producto     INT,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria       VARCHAR(50),
    stock           INT          NOT NULL
);

CREATE TABLE inventario_sucursal_sur (
    id_producto     INT,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria       VARCHAR(50),
    stock           INT          NOT NULL
);

-- Sucursal Norte
INSERT INTO inventario_sucursal_norte VALUES (101, 'Laptop Pro 15',      'Computación',  8);
INSERT INTO inventario_sucursal_norte VALUES (102, 'Mouse Inalámbrico',  'Accesorios',  30);
INSERT INTO inventario_sucursal_norte VALUES (103, 'Monitor 4K 27"',     'Computación',  5);
INSERT INTO inventario_sucursal_norte VALUES (104, 'Teclado Mecánico',   'Accesorios',  20);
INSERT INTO inventario_sucursal_norte VALUES (105, 'Auriculares BT Pro', 'Audio',       15);
-- Estos productos también existen en la Sucursal Sur (importantes para UNION)
INSERT INTO inventario_sucursal_norte VALUES (106, 'SSD Externo 1TB',    'Almacenamiento', 10);
INSERT INTO inventario_sucursal_norte VALUES (107, 'Webcam HD 1080p',    'Accesorios',  12);

-- Sucursal Sur
INSERT INTO inventario_sucursal_sur VALUES (103, 'Monitor 4K 27"',     'Computación',   3);
INSERT INTO inventario_sucursal_sur VALUES (104, 'Teclado Mecánico',   'Accesorios',   18);
INSERT INTO inventario_sucursal_sur VALUES (106, 'SSD Externo 1TB',    'Almacenamiento', 7);
-- Estos productos son exclusivos de la Sucursal Sur
INSERT INTO inventario_sucursal_sur VALUES (108, 'Laptop Basic 14',    'Computación',   6);
INSERT INTO inventario_sucursal_sur VALUES (109, 'Parlante Bluetooth', 'Audio',        22);
INSERT INTO inventario_sucursal_sur VALUES (110, 'Hub USB-C 7p',       'Accesorios',   35);
INSERT INTO inventario_sucursal_sur VALUES (111, 'Webcam HD 1080p',    'Accesorios',    9);


USE Ventas_Tech_DB;
GO

-- CONSULTA 1: UNION --

SELECT
    id_producto, nombre_producto, categoria

FROM inventario_sucursal_norte 

UNION

SELECT
    id_producto, nombre_producto, categoria 

FROM inventario_sucursal_sur 

ORDER BY  id_producto, categoria, nombre_producto;

-- Hallazgo: la red comercializa 11 códigos de producto, pero son 10 productos reales:
-- la Webcam HD 1080p figura con ID 107 en Norte y 111 en Sur. Hay que unificar el código.


-- CONSULTA 2: UNION --

SELECT 
    COUNT(*)   AS total_registros,
    SUM(stock) AS total_unidades

FROM (

SELECT
    id_producto, nombre_producto, categoria, stock, 'Norte' AS sucursal

FROM inventario_sucursal_norte 

UNION ALL

SELECT
     id_producto, nombre_producto, categoria, stock, 'Sur' AS sucursal

FROM inventario_sucursal_sur 

) AS Auditoria; 

-- Hallazgo: existen 14 registros de stock con 200 unidades en total, repartidas en partes
-- iguales (100 por sucursal). Son 4 registros más que los 10 productos únicos de la Consulta 1,
-- porque 4 productos tienen stock en ambas sucursales (Monitor, Teclado, SSD y Webcam).

-- ── CONSULTA 3: COMPARACIÓN DE RESULTADOS ─

SELECT COUNT(*) AS filas_union
FROM (
    SELECT id_producto, nombre_producto, categoria
    FROM inventario_sucursal_norte

    UNION

    SELECT id_producto, nombre_producto, categoria
    FROM inventario_sucursal_sur
) AS resultado_union;

SELECT COUNT(*) AS filas_union_all
FROM (
    SELECT id_producto, nombre_producto, categoria
    FROM inventario_sucursal_norte

    UNION ALL

    SELECT id_producto, nombre_producto, categoria
    FROM inventario_sucursal_sur
) AS resultado_union_all;

