use BikeStores
go
select 
	ord.order_id,
	CONCAT(cus.first_name,'',cus.last_name) AS 'customers',
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	bra.brand_name,
	CONCAT(sta.first_name,'',sta.last_name) AS 'sales_rep',
	SUM(ite.quantity) AS 'total_units',
	SUM(ite.quantity* ite.list_price) AS 'revenue'

from sales.orders ord 
JOIN sales.customers cus
ON ord.customer_id=cus.customer_id
JOIN sales.order_items ite
ON ord.order_id=ite.order_id
JOIN production.products pro
ON ite.product_id=pro.product_id
JOIN production.categories cat
ON cat.category_id=pro.category_id
JOIN sales.stores sto
ON ord.store_id=sto.store_id
JOIN sales.staffs sta
ON ord.staff_id=sta.staff_id
JOIN production.brands bra
ON bra.brand_id=pro.brand_id

GROUP BY 
	ord.order_id,
	CONCAT(cus.first_name,'',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	product_name,
	cat.category_name,
	sto.store_name,
	bra.brand_name,
	CONCAT(sta.first_name,'',sta.last_name)