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

