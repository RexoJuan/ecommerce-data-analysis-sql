-- Verificar que las tablas tienen datos
SELECT 'Clientes' as tabla, COUNT(*) as total FROM clientes
UNION ALL
SELECT 'Pedidos', COUNT(*) FROM pedidos
UNION ALL
SELECT 'Pagos', COUNT(*) FROM pagos;

-- Ver los primeros 5 registros de pedidos para entender el formato de fecha
SELECT * FROM pedidos FETCH FIRST 5 ROWS ONLY;



