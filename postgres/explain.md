# explain

source:

- http://www.louisemeta.com/blog/explain/
- https://stackoverflow.com/questions/33549914/why-planing-time-and-execution-time-are-so-different-postgres
- https://www.cybertec-postgresql.com/en/postgresql-indexing-index-scan-vs-bitmap-scan-vs-sequential-scan-basics/
- https://kimlaitrinh.me/blog/comprendre-les-scans-de-postgresql/

## query cycle

- The query is parsed into a query tree
- The planner and the optimizer generates query plans (planning time)
- the best query plan is executed (execution time)

## (cost=0.00..205.01 rows=1 width=35)

- 0.00 -> cost of retrieving the first row
- 205.01 -> the estimated cost of retrieving all the rows
- rows -> estimated number of rows returned
- width -> avg size of a row (in KB) 

## (actual time=1.945..1.946 rows=1 loops=1) - when if i am using analyze

## Index Scan

- An index it has to “jump” between the pointers given by the tuples (value, pointer) in the index.

Used for:

- When only a small set of rows is selected, PostgreSQL can directly ask the index.

> Moving the reading head is 1000 slower than reading the next physical block. When you read a book, reading the next page is easier for you than jumping to the page 34, then 98, then 12… It’s the same for the reading head :)

## Sequential scan ?

The reading head reads in memory order, so it only has to go to the next memory block to scan the tables. 

Used for:

- A value is common in your table

## Bitmap scan

- You read too much for an index scan to be efficient but too little for a sequential scan

- In first, postgres reads the index and keep in memory where (physical memory) the condition exists into a map. The goal is to limit the “jumps” of the reading head between rows.

- Block after block, postgres rechecks each rows
