## Elasticsearch

### Bulk indexing usage

For example, the update settings API can be used to dynamically change the index from being more performant for bulk indexing, and then move it to more real time indexing state. Before the bulk indexing is started, use:

```
PUT /my-index-000001/_settings
{
  "index" : {
    "refresh_interval" : "-1"
  }
}
```
