USE `northwind`;

/*Primer ejercicio */

SELECT `customers`.`customer_id` AS `Identificador`, `customers`.`company_name` AS `NombreEmpresa`, COUNT(`orders`.`order_id`) AS `NumeroPedidos` 
FROM `customers` INNER JOIN `orders`
ON `customers`.`customer_id` = `orders`.`customer_id`
WHERE `customers`.`country` = "UK"
GROUP BY  `customers`.`customer_id`;

/*Segundo ejercicio */

SELECT `customers`.`company_name`AS `NombreEmpresa`, YEAR(`orders`.`order_date`) AS `Año`, SUM(`order_details`.`quantity`) AS `NumObjetos`
FROM `customers` 
INNER JOIN `orders` ON `customers`.`customer_id` = `orders`.`customer_id`
INNER JOIN `order_details` ON `orders`.`order_id` = `order_details`.`order_id`
WHERE `customers`.`country` = "UK"
GROUP BY `customers`.`company_name`, `Año`;

/*Tercer ejercicio */

SELECT `customers`.`company_name`AS `NombreEmpresa`, YEAR(`orders`.`order_date`) AS `Año`, SUM(`order_details`.`quantity`) AS `NumObjetos`, SUM(`order_details`.`unit_price` * `order_details`.`quantity` - (`order_details`.`discount` * `order_details`.`unit_price` * `order_details`.`quantity`)) AS `DineroTotal`
FROM `customers` 
INNER JOIN `orders` ON `customers`.`customer_id` = `orders`.`customer_id`
INNER JOIN `order_details` ON `orders`.`order_id` = `order_details`.`order_id`
WHERE `customers`.`country` = "UK"
GROUP BY `customers`.`company_name`, `Año`;

/*Cuarto ejercicio */

 SELECT `company_name`, `orders`.`order_id`, `order_date`, `country`
		FROM `customers` 
		INNER JOIN `orders` 
		ON `c`.`customer_id` = `o`.`customer_id`;
 
 /*Quinto ejercicio */
 
SELECT `categories`.`category_id`, `categories`.`category_name`, `products`.`product_name`, `products`.`unit_price`*`products`.`units_on_order` AS `Importe_total`
		FROM `categories`
		INNER JOIN `products` 
		ON `categories`.`category_id` = `products`.`category_id`
		HAVING `Importe_total` >0;
      

/*Sexto ejercicio */

SELECT `customers`.`company_name`, `orders`.`order_id`, `orders`.`order_date`
		FROM `customers` AS `c`
		NATURAL JOIN `orders` AS `o`;

/*Séptimo ejercicio */

SELECT `customers`.`company_name`, COUNT(`orders`.`order_id`) AS total_pedidos, `customers`.`country`
		FROM `customers` 
        INNER JOIN `orders` 
        ON `c`.`customer_id` = `o`.`customer_id`
        GROUP BY (`o`.`customer_id`)
        HAVING `c`.`country` = 'UK';

/*Octavo ejercicio */

SELECT `customers`.`company_name`, `orders`.`order_id`, `orders`.`order_date`, `customers`.`country`
		FROM `customers` 
		LEFT JOIN `orders` 
		ON `customers`.`customer_id` = `o`.`customer_id`
        WHERE `customers`.`country` = 'UK'
		UNION
		SELECT `customers`.`company_name`, `orders`.`order_id`, `o`.`order_date`, `customers`.`country`
		FROM `orders` 
		LEFT JOIN `customers` 
		ON `customers`.`customer_id` = `orders`.`customer_id`
		WHERE `customers`.`country` = 'UK';         
        
 
