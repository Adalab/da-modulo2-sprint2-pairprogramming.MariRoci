-- pairprogramming Subconsultas
USE northwind;
-- 1 Extraed los pedidos con el máximo "order_date" para cada empleado.
-- fecha de los pedidos más recientes que ha gestionado cada empleado con query correlacionada.



-- 2 Extraed el precio unitario máximo (unit_price) de cada producto vendido.
-- productos vendidos y su precio unitario con queries correlacionadas.


-- 3 Extraed información de los productos "Beverages"
-- Devuelve el ID del producto, el nombre del producto y su ID de categoría. Subconsultas

-- Error Code: 1241. Operand should contain 1 column(s)

SELECT c.category_id, c.category_name,
       (SELECT p.product_id, p.product_name
       FROM products p 
       WHERE p.category_id = c.category_id) AS products_in_category
FROM categories c
WHERE category_name = 'Beverages';

-- 4 lista de países donde viven clientes sin proveedor en ese país
-- (SELECT 1 == SELECT *) --
SELECT DISTINCT c.country
FROM customers c
WHERE NOT EXISTS (
    SELECT *
    FROM suppliers s
    WHERE s.country = c.country
);

-- 5 clientes que compraron +20 articulos "Grandma's Boysenberry Spread" en 1 pedido.
-- OrderId y el nombre del cliente (ProductID 6) en un solo pedido.

SELECT order_id, product_id, quantity > 20
FROM order_details
WHERE(
	SELECT order_id, customer_id
    WHERE(
		SELECT customer_number, customer_number
        FROM customers
        WHERE customer_id = customer_number)
FROM orders);

SELECT order_id, product_id, quantity
FROM order_details
WHERE order_id IN (
    SELECT order_id
    FROM orders
    WHERE customer_id IN (
        SELECT customer_number
        FROM customers
        )
)
AND quantity > 20;




-- 6 Extraed los 10 productos más caros con queries correlacionadas.



-- 7 BONUS: Qué producto es más popular (más ha sido comprado y la cantidad que se compró).


