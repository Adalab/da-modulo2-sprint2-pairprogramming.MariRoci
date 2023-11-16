USE `northwind`;

/*Queries Avanzadas */

/*Primer ejercicio. Productos más barato y más caros */
SELECT `product_name`, `unit_price` AS `lowestPrice`
	FROM `products`
	WHERE `unit_price` = (SELECT MIN(`unit_price`) FROM `products`);

SELECT `product_name`, `unit_price` AS `highestPrice`
	FROM `products`
	WHERE `unit_price` = (SELECT MAX(`unit_price`) FROM `products`);

/*Segundo ejercicio. Productos y su precio medio */

SELECT COUNT(`quantity_per_unit`) AS `cantidad`, AVG (`unit_price`)
	FROM `products`;

/*Tercer ejercicio. MIN y MAX carga en UK*/

 SELECT MIN(`freight`), `ship_country`
	FROM `orders`
	WHERE `ship_country` = "UK";
    
 SELECT MAX(`freight`), `ship_country`
	FROM `orders`
	WHERE `ship_country` = "UK";   
 
 /*Cuarto ejercicio. Precios de productos por encima de la media*/
 
 SELECT `product_name`, `unit_price` AS `precio_superior_media`
	FROM `products`
	WHERE `unit_price`> (SELECT AVG(`unit_price`) FROM `products`);
 
SELECT `product_name`, `unit_price` AS `precio_superior_media`
	FROM `products`
	WHERE `unit_price` > (SELECT AVG(`unit_price`) FROM `products`)
	ORDER BY `unit_price` ASC;

/*Quinto ejercicio. Productos que se han descontinuado*/

SELECT `product_name`, `discontinued`
	FROM `products`
	WHERE `discontinued` = 1;

SELECT COUNT(*) AS  `total_productos_descontinuados`
	FROM `products`
	WHERE `discontinued` = 1;

/*Sexto ejercicio. Detalle de los productos no descontinuados*/

SELECT `product_id`, `product_name`,
	CASE
   	WHEN `discontinued` = 0 THEN "No discontinuado"
    END AS  `productos_no_descontinuados`
	FROM  `products `
	LIMIT 10;  

/*Séptimo ejercicio. Número de pedidos y Max carga, según empleado*/
   
SELECT `employee_id`, COUNT(`order_id`), MAX(`freight`)
  FROM `orders`
  GROUP BY `employee_id`;
  
/*Octavo ejercicio. Descartar pedidos sin fechas y ordenarlos*/
 
 SELECT `employee_id`, COUNT(`order_id`) AS `Num_pedidos`, 
	MAX(`freight`) AS `pedido_mas_pesado`
	FROM `orders`
	WHERE `shipped_date` IS NOT NULL
	GROUP BY `employee_id`;

/*Noveno ejercicio. Número de pedidos por día*/

SELECT	DAY(`order_date`) AS `Dia`, 
		MONTH(`order_date`) AS `Mes`, 
        YEAR(`order_date`) AS `Año`, COUNT(`order_id`)
	FROM `orders`
	GROUP BY `Dia`, `Mes`, `Año`; 
	
/*Décimo ejercicio. Número de pedidos por mes y año*/
		
SELECT 	MONTH (`order_date`) AS `Mes`, 
		YEAR (`order_date`) AS `Año`, 
        COUNT(`order_id`) AS `numero_de_pedidos`
	FROM `orders`
	GROUP BY `Mes`, `Año`;
    
/*Undécimo ejercicio. Ciudades con más de 4 empleadas*/

SELECT `city`, COUNT(city) AS `total_empleadas`
FROM `employees`
GROUP BY `city`
HAVING `total_empleadas` >= 4;

/*Duodécimo ejercicio. Nueva columna monetaria*/

SELECT `order_id`, SUM(`unit_price`*`quantity`) AS `precio_total`,
CASE
		WHEN SUM(`unit_price`*`quantity`)> 2000 THEN 'Alto'
		ELSE 'Bajo'
	END AS `categoria_pedidos`
FROM `order_details`
GROUP BY `order_id`;