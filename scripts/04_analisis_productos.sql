-- Análisis de Ventas por Categoría de Producto
-- Este query identifica cuáles son los motores de ingreso del negocio.
SELECT 
    p.product_category_name AS categoria,
    COUNT(i.order_id) AS unidades_vendidas,
    ROUND(SUM(i.price), 2) AS ingresos_totales,
    ROUND(AVG(i.price), 2) AS precio_promedio_unidad
FROM ecommerce_olist.items i
JOIN ecommerce_olist.productos p ON i.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY ingresos_totales DESC
FETCH FIRST 10 ROWS ONLY;