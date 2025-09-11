--1. Pedidos por estado
SELECT c.customer_state, COUNT(*) AS total_pedidos
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_pedidos DESC;

--2. Métodos de pagamento mais utilizados
SELECT payment_type, COUNT(*) AS total_pagamentos
FROM order_payments
GROUP BY payment_type
ORDER BY total_pagamentos DESC;


--3. Status dos pedidos
SELECT order_status, COUNT(*) AS total_pedidos
FROM orders
GROUP BY order_status
ORDER BY total_pedidos DESC;


--4. Vendedores por estado
SELECT seller_state, COUNT(*) AS total_vendedores
FROM sellers
GROUP BY seller_state
ORDER BY total_vendedores DESC;


--5. Top 10 categorias com mais produtos
SELECT product_category_name, COUNT(*) AS total_produtos
FROM products
GROUP BY product_category_name
ORDER BY total_produtos DESC
LIMIT 10;

