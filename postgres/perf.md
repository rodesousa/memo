# perf

## shared_buffer

shared_buffer is postgres buffer

data is written to shared_buffer then kernel buffer then disk

## wal_buffer

pg writes into buffers and flushed to disk

if there are a lot of connections, you have to increase this value

## effective_cache_size

estimation of memory available for disk caching (just guideline not the exact allocated memory)

## work_mem

the bigger it is the faster the sort

## maintenance_work_mem

setting a large value help for VACUUM, create index, alter table
