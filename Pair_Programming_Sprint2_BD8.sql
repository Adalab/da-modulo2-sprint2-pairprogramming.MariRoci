
USE `northwind`;

## CTE´s

## 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.

WITH `nombre_Compañia` AS(
	SELECT `company_name` AS `nombreCompañia`, `customer_id` AS `id_cliente` 
	FROM `customers`)
SELECT * 
	FROM `nombre_Compañia`; 
    
## 2. Seleccionar lo que venga de Germany

WITH `nombre_Compañia` AS(
	SELECT `company_name` AS `NombreCompañia`, `customer_id` AS `id_cliente` 
	FROM `customers`
    WHERE `country` = "Germany")
SELECT * 
	FROM `nombre_Compañia`;
    
## 3. Extraer el id de las facturas y fecha de cada cliente

WITH `factura_fecha` AS (
SELECT `orders`.`customer_id`AS `CustomerID`,`orders`.`order_id` AS `OrderID`, `orders`.`order_date` AS `Fechas_Pedido`, `customers`.`company_name` AS `CompanyName`
	FROM `orders` 
    NATURAL JOIN  `customers`  )
SELECT *
		FROM `factura_fecha`;

## 4. Contad el número de facturas por clientes.

WITH `NumeroFacturas` AS (
SELECT `orders`.`customer_id`AS `CustomerID`, `customers`.`company_name` AS `CompanyName`, COUNT(`orders`.`customer_id`) AS `NumeroFacturas`
	FROM `orders` 
    NATURAL JOIN  `customers`
    GROUP BY `customers`.`company_name`,
    `orders`.`customer_id`)
SELECT *
		FROM `NumeroFacturas`;

    