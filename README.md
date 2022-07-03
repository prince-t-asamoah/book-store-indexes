# Book Store Indexes

Let’s imagine we are running an online book store and need to keep track of what books we offer.  
The `setup.sql` inside `book_store_indexes` directory contains the queries to create the database schema  
and the `indexes.sql` to add more indexes for query performance experimentation.  
The `customers.txt`, `books.txt` and `orders.txt` contains all the data needed for populating the database.  

The database project contains three tables:

- customers : contains details of all customers including name, email, phone number and email address etc.
- books: contains the [top selling books of all time](https://en.wikipedia.org/wiki/List_of_best-selling_books)
- orders: contains orders made by customers

Database indexes aside primary key indexes has been added to this database to aid in performance and maintainance.

**NB:** The customers and orders tables are randomly generated.

Have fun!!
