```
iex(11)> [a, b, c] = [1, 2, 3, 4]
** (MatchError) no match of right hand side value: [1, 2, 3, 4]
```

# We can use destructure/2 to do the job.

```
iex(1)> destructure [a, b, c], [1, 2, 3, 4]
[1, 2, 3]
iex(2)> {a, b, c}
{1, 2, 3}
```
