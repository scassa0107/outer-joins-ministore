¿Por qué usaste LEFT JOIN para la Consulta 1 y no INNER JOIN? ¿Qué se perdería si usaras INNER JOIN?

 porque necesitábamos conservar todo el catálogo de productos (la tabla de la izquierda), incluso aquellos que no tienen ventas.
Si hubieras usado un INNER JOIN, se habrían perdido todos 
los productos que nunca se vendieron, ya que el INNER JOIN solo muestra las filas que tienen una coincidencia exacta en ambas tablas.

¿Por qué usaste RIGHT JOIN para la Consulta 2? ¿Qué tabla está a la izquierda y cuál a la derecha en tu consulta?

Se usó RIGHT JOIN para priorizar la tabla de ventas y asegurar que se evalúen absolutamente todas las transacciones. En la estructura de la consulta 
(FROM productos AS PR RIGHT JOIN ventas AS VTS ), la tabla productos está a la izquierda y la tabla ventas está a la derecha.

Los valores NULL Representan la ausencia de un valor, un dato desconocido o la falta de coincidencia entre las tablas.


¿Qué representan los valores NULL en cada resultado? Explicá con un ejemplo concreto de los datos qué significa que venta_id sea NULL en la Consulta 1 y que producto_id de productos sea NULL en la Consulta 2.


Los valores NULL Representan la ausencia de un valor, un dato desconocido o la falta de coincidencia entre las tablas.

En la Consulta 1: Que venta_id sea NULL significa que ese producto del catálogo (ej. el Hub USB-C 7p) no tiene ninguna venta registrada.   
En la Consulta 2: Que el producto_id de productos sea NULL significa que existe una venta registrada en la tabla de ventas (ej. el producto 999) que no existe en nuestro catálogo oficial.

¿Cuándo usarías FULL OUTER JOIN en un caso real de negocio? 

En un caso real de negocio se usaría cuando necesitas una visión completa y simétrica de ambas tablas, conservando todos los registros de los dos lados (tanto los que hacen match como los que no), 
por ejemplo, al reconciliar bases de datos de dos sistemas distintos o cruzar clientes y campañas donde algunos no participaron en absoluto.


