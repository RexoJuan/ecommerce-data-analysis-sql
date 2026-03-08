-- 1. Cálculo de Ticket Promedio (AOV - Average Order Value)
-- Este KPI indica cuánto gasta un cliente en promedio por cada compra.
SELECT 
    ROUND(AVG(PAYMENT_VALUE), 2) AS ticket_promedio
FROM ecommerce_olist.pagos;

-- 2. Métodos de pago más utilizados
-- Útil para entender las preferencias financieras del cliente.
SELECT 
    PAYMENT_TYPE,
    COUNT(*) AS cantidad_transacciones,
    ROUND(SUM(PAYMENT_VALUE), 2) AS total_recaudado
FROM ecommerce_olist.pagos
GROUP BY PAYMENT_TYPE
ORDER BY total_recaudado DESC;

-- 3. Pedidos por Estado (Geografía del cliente)
-- Une CLIENTES con PEDIDOS para ver dónde está el mercado fuerte.
SELECT 
    c.customer_state AS estado,
    COUNT(o.order_id) AS total_pedidos
FROM ecommerce_olist.clientes c
JOIN ecommerce_olist.pedidos o ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_pedidos DESC;