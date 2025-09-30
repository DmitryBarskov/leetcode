SELECT
  Product.product_name, Sales.year, Sales.price
FROM Sales
NATURAL JOIN Product
;
