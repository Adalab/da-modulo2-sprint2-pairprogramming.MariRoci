-- pairprogramming Subconsultas

USE northwind;
-- 1 Extraed los pedidos más recientes (máximo "order_date") que ha gestionado cada empleado con query correlacionada
-- orderid, custid,employee id, order date, required date
SELECT `o`.`order_id`, `o`.`customer_id`, `o`.`employee_id`, `o`.`order_date`, `o`.`required_date`
FROM `orders` AS `o`
WHERE `o`.`order_date` = (
    SELECT MAX(`o_inner`.`order_date`)
    FROM `orders` `o_inner`
    WHERE o_inner.`employee_id` = `o`.`employee_id`
);

-- 2 Extraed el precio unitario máximo (unit_price) de cada producto (prodct_id y Max_unit_price_sold) con queries correlacionadas.

SELECT `od`.`product_id`, MAX(`od`.`unit_price`) AS `Max_unit_price_sold`
FROM `order_details` AS `od`
WHERE `od`.`unit_price` = (
    SELECT MAX(`od_inner`.`unit_price`)
    FROM `order_details` `od_inner`
    WHERE `od_inner`.`product_id` = `od`.`product_id`
)
GROUP BY `od`.`product_id`;

-- 3 Extraed información de los productos "Beverages"
-- Devuelve el ID del producto, el nombre del producto y su ID de categoría. Subconsultas

SELECT `product_id`, `product_name`, `category_id`
FROM `products`
WHERE `category_id` = (
        SELECT `category_id`
        FROM `categories`
        WHERE `category_name` = 'Beverages'
    );

-- 4 lista de países donde viven clientes sin proveedor en ese país
-- (SELECT 1 == SELECT *) --
SELECT DISTINCT `c`.`country`
FROM `customers` AS `c`
WHERE NOT EXISTS (
    SELECT *
    FROM `suppliers` AS `s`
    WHERE `s`.`country` = `c`.`country`
);

-- 5 clientes que compraron +20 articulos "Grandma's Boysenberry Spread" (ProductID 6) en 1 pedido.
-- OrderId y el nombre del cliente (ProductID 6) en un solo pedido.

SELECT `od`.`order_id`, (
    SELECT `o`.`customer_id`
    FROM `orders` AS `o`
    WHERE `o`.`order_id` = `od`.`order_id`
) AS `customer_id`
FROM `order_details` AS `od`
WHERE `od`.`product_id` = 6
AND `od`.`quantity` > 20;

-- 6 Extraed los 10 productos más caros con queries correlacionadas. Ten_Most_Expensive_Products (nombre) , unit price
SELECT `p`.`product_name` AS `Ten_Most_Expensive_Products`, `p`.`unit_price`
FROM `products` AS `p`
WHERE `p`.`unit_price` IN (
    SELECT DISTINCT `p1`.`unit_price`
    FROM `products` AS `p1`
    WHERE (
        SELECT COUNT(DISTINCT `p2`.`unit_price`)
        FROM `products` AS `p2`
        WHERE `p2`.`unit_price` >= `p1`.`unit_price`
    ) <= 10
);

-- 7 BONUS: Qué producto es más popular (más ha sido comprado y la cantidad que se compró).


