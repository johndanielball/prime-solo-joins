--01.Get all customers and their addresses.
SELECT * 
FROM customers
JOIN addresses
ON customers.id = addresses.customer_id

--02.Get all orders and their line items.
SELECT *
FROM orders
JOIN line_items
ON orders.id = line_items.order_id

--03.Which warehouses have cheetos?
SELECT *
FROM warehouse
JOIN warehouse_product
ON warehouse.id = warehouse_product.warehouse_id
JOIN products
ON warehouse_product.product_id = products.id
WHERE products.description = 'cheetos'


--04.Which warehouses have diet pepsi?
SELECT *
FROM warehouse
JOIN warehouse_product
ON warehouse.id = warehouse_product.warehouse_id
JOIN products
ON warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi'

--05.Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.id, COUNT(orders.id)
FROM customers
JOIN addresses
ON customers.id = addresses.customer_id
JOIN orders
ON addresses.id= orders.address_id
GROUP BY customers.id


--06.How many customers do we have?
SELECT count(*)
FROM customers


--07.How many products do we carry?
SELECT count(*)
FROM products


--08.What is the total available on-hand quantity of diet pepsi?
SELECT sum(warehouse_product.on_hand)
FROM warehouse_product
JOIN products
ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi'