-- 1. Display all columns in customers, orders and books table
SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

-- 2. Display all indexes in customers, orders and books table
SELECT * FROM pg_indexes
WHERE tablename IN ('customers', 'orders', 'books')
ORDER BY tablename, indexname;

-- 3. Display performance statistics on selection from orders where quantity is greater than 18
EXPLAIN ANALYZE
SELECT customer_id, quantity
FROM orders
WHERE quantity > 18;

-- 4. Create an index on orders table for when quantity is greater than 18
CREATE INDEX customer_id_quantity_more_than_18_idx ON orders(customer_id, quantity)
WHERE quantity > 18;

-- 5. Display performance statistics on selection from orders where quantity is greater than 18
EXPLAIN ANALYZE
SELECT customer_id, quantity
FROM orders
WHERE quantity > 18;

-- 6. Display perforamnce statistics on selection with customer id, with and without 
-- an index on customers table
-- Without primary key index
EXPLAIN ANALYZE
SELECT * FROM customers
WHERE customer_id = '91430';

ALTER TABLE customers
ADD PRIMARY KEY(customer_id);

-- With primary key index
EXPLAIN ANALYZE
SELECT * FROM customers
WHERE customer_id = '91430';

-- 7. Rebuild customers indexes with primary key index
CLUSTER customers USING customers_pkey;

-- 8. Create a composite index for customer and book id
CREATE INDEX customer_id_book_id_idx
ON orders(customer_id, book_id);

-- 9. Delete index for customer and book id
DROP INDEX customer_id_book_id_idx;

CREATE INDEX customer_id_book_id_quantity_idx
ON orders(customer_id, book_id, quantity);

-- 10. Displays performance statistics with and without a book, author and title index on books
EXPLAIN ANALYZE
SELECT author, title
FROM books
WHERE author = 'J.K. Rowling'
AND title = 'Harry Potter and the Chamber of Secrets';

CREATE INDEX book_author_title_idx
ON books(author, title);

EXPLAIN ANALYZE
SELECT author, title
FROM books
WHERE author = 'J.K. Rowling'
AND title = 'Harry Potter and the Chamber of Secrets';

-- 11. Displays performance statistics on selection from orders
EXPLAIN ANALYZE
SELECT * FROM orders
WHERE quantity * price_base > 100;

-- 12. Create an index for customer total price on every order on orders
CREATE INDEX customer_total_price_on_each_order_idx
ON orders((quantity * price_base > 100));

-- 13. Displays performance statistics of selection from orders
EXPLAIN ANALYZE
SELECT * FROM orders
WHERE quantity * price_base > 100;

-- 14. Delete and create indexes from customers and books
DROP INDEX IF EXISTS books_author_idx;
DROP INDEX IF EXISTS books_title_idx;
DROP INDEX IF EXISTS customer_id_book_id_quantity_idx;

CREATE INDEX
customers_last_name_first_name_email_address
ON customers (last_name, first_name, email_address);

SELECT * FROM pg_indexes
WHERE tablename IN ('customers', 'orders', 'books')
ORDER BY tablename, indexname;