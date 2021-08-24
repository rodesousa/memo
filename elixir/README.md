# Elixir

- [Makefile](./Makefile)
- [Supervisor](#supervisor)
- [Ecto](#ecto)
- [Phoenix](#phoenix)
- [Config Env var](#env-var)

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

## ecto

```
mix ecto.create
mix ecto.migrate
```

## phoenix

### json

```
mix phx.gen.json Accounts User users name:string age:integer
```

## env var

config :binance,
  api_key: "xxx",
  secret_key: "xxx",
  api_key: System.get_env("BINANCE_API_KEY") || raise("BINANCE_API_KEY"),
  secret_key: System.get_env("BINANCE_SECRET_KEY") || raise("BINANCE_SECRET_KEY"),
  end_point: "https://api.binance.us" # Add for the US API end point. The default is for "https://api.binance.com"

```
defmodule Binance.Config do
  @moduledoc """
  Provides configuration keys settings during the runtime.
  """
  def set(:api_key, value), do: Application.put_env(:binance, :api_key, value)
  def set(:secret_key, value), do: Application.put_env(:binance, :secret_key, value)
  end
```
