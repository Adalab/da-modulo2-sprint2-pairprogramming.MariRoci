USE `northwind`;

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