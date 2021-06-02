## supervisor

### How to add a genserver into a supervisor ?

```
def start(_type, _args) do
  children = [
    %{
      id: Event.EventController,
      start: {Event.EventController, :start_link, []}
    }
  ]

  opts = [strategy: :one_for_one, name: Pex.Supervisor]
  Supervisor.start_link(children, opts)
end
```
