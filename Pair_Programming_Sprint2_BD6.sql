-- pairprogramming Operadores Especiales de Filtro (de northwind)
USE northwind;
-- ej.1 Ciudades que empiezan con "A" o "B".
SELECT `city`, `company_name`, `contact_name` FROM customers
WHERE `city` LIKE 'A%' OR `city` LIKE 'B%';

-- ej.2 Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT `city`, `company_name`, `contact_name`, `c`.`customer_id`, COUNT(`order_id`) AS `num_orders`
FROM `customers` AS `c`
LEFT JOIN `orders` AS `o` ON `o`.`customer_id` = `c`.`customer_id`
WHERE `city` LIKE 'L%'
GROUP BY `city`, `company_name`, `contact_name`, `c`.`customer_id`;

-- ej.3 Todos los clientes cuyo "contact_title" no incluya "Sales".

SELECT `contact_name`, `contact_title`, `company_name`
FROM `customers`
WHERE `contact_title` NOT LIKE '%Sales%';

-- ej.4 Todos los clientes que no tengan una "A" en segunda posición en su nombre.
SELECT `company_name`
FROM `customers`
WHERE `company_name` NOT LIKE '_A%';

-- ej.5 info clientes y proveedores: ciudad, nombre cli, contacto, relación (si es Proveedor o Cliente), SIN DUPLICADOS, columna temporal alias Relationship

SELECT 'customer' AS `Relationship`, `city`, `company_name`, `contact_name`
FROM `customers`
UNION
SELECT 'supplier' AS `Relationship`, `city`, `company_name`, `contact_name`
FROM `suppliers`;

-- ej.6 Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet"

SELECT `description`
FROM `categories`
WHERE `description` LIKE '%sweet%' OR description LIKE '%Sweet%';

-- ej.7 tabla con nombres y apellidos de los clientes (suponemos que pide la persona de contacto) y empleados

-- uniendo los nombres y apellidos con su relación con la empresa:
SELECT 'employee' AS `Relationship`, CONCAT(`first_name`, ' ', `last_name`) AS `full_name`
FROM `employees`
UNION
SELECT 'customer' AS `Relationship`, `contact_name`
FROM `customers`;

-- uniendo sólo los nombres y apellidos (listado de personas):
SELECT CONCAT(`first_name`, ' ', `last_name`) AS `full_name`
FROM `employees`
UNION
SELECT `contact_name`
FROM `customers`;



