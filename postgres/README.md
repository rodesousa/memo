# Making use of the PostgreSQL slow query log

```
ALTER DATABASE test SET log_min_duration_statement = 5000;
```

test ?

```
SELECT pg_sleep(10);
```

# Checking unstable execution plans

```
LOAD 'auto_explain';
SET auto_explain.log_analyze TO on;
SET auto_explain.log_min_duration TO 500;
```

# weight of db

```
SELECT pg_size_pretty( pg_database_size('dbname') );
```

# [explain](./explain.md)
