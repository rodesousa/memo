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

```
config :binance,
  api_key: "xxx",
  secret_key: "xxx",
  api_key: System.get_env("BINANCE_API_KEY") || raise("BINANCE_API_KEY"),
  secret_key: System.get_env("BINANCE_SECRET_KEY") || raise("BINANCE_SECRET_KEY"),
  end_point: "https://api.binance.us" # Add for the US API end point. The default is for "https://api.binance.com"
```

```
defmodule Binance.Config do
  @moduledoc """
  Provides configuration keys settings during the runtime.
  """
  def set(:api_key, value), do: Application.put_env(:binance, :api_key, value)
  def set(:secret_key, value), do: Application.put_env(:binance, :secret_key, value)
  end
```

## ecto

Create ecrto config with postgres

```
mix ecto.gen.repo -r Friends.Repo
```

Add schema

```
defmodule Pex.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add(:type, :string)
      add(:quantity, :float)
      add(:purchase_id, references(:purchases))
      add(:price, :float)
    end

    create(index(:orders, [:id]))
  end
end

defmodule Pex.Trade.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field(:type, :string)
    field(:quantity, :float)
    field(:price, :float)

    belongs_to(:purchase, Pex.Trade.Purchase)
  end

  @attrs [:symbol, :quantity, :price, :purchase_id]

  def changeset(purchase, params \\ %{}) do
    purchase
    |> cast(params, @attrs)
    |> validate_required(@attrs)
  end
end
```

## mix deps

```
mix deps.clean name
mix deps.update name
```

## How to have a exe time ?

```
start = System.monotonic_time(:milisecond)
milli_taken = System.monotonic_time(:milisecond) - start
Logger.info("Mill taken = #{milli_taken}")
```

## Log configuration

```
# config/config.exs

config :logger, :console,
  level: :debug,
  format: "$date $time [$level] $metadata$message\n",
  metadata: [:user_id]
```

## Enum tips

```
Enum.frequencies
Enum.max_by (with struct)
Enum.zip
```

## String tips

```
String.split(trim: true)
String.trim
```

## Tuple tips

```
Tuple.to_list
elem({1,2}, 0) # 1
```

## function tips

```
...
|> Enum.map(&String.to_integer(&1)) == Enum.map(& String.to_integer/1)
```
