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

### Updating documents

```
POST /library/_update/1
{
  "script": {
    "source": "ctx._source.price += params.addition",
    "params": { "addition": 4 }
  }
}
```

ctx map gives access to several information (_index,_id ...)

possible to delete fields:
`"source" : "ctx._source.remove(\"price\")"`

### Document identifier

During the document indexing, the identifier can be specified (PUT) or automatically generated (POST)

### Test Analysis

- Analyzer

Allows to configure an analysis process which can be referenced by a logical name in the mappings
Is composed of a Tokenizer and one or more CharFilter and/or TokenFilters

- CharFilter

First step of the text analysis (optional)
Allows to filter/modify the text before the tokenizer phase

- Tokenizer

Second step of the text analysis
Generate tokens from a text

- TokenFilter

Following steps of the text analysis
Allows to modify, delete or add tokens
Executed one after the other: the result produced by the 1st TokenFilter is the input of the 2nd TokenFilter, etc

## Updating Analyzers

Impossible to update analyzers and token filters when the index is being used (hot update)

Procedure :

- The index must be closed via the the Close API
`POST /zenika/_close`
  + stop read/write operations on the index
  + keeps data on disk but remove them from heap
  + alternative to simply deleting an index

- Update the index analysis definition using the API PUT Settings

- Open the index with the API Open

`POST /zenika/_open`
