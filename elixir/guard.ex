defmodule MyGuards do
  defmacro is_kid(age) do
    quote do: unquote(age) < 12
  end

  defmacro is_adult(age) do
    quote do: unquote(age) > 18
  end
end

# order of module matters here.....
defmodule Hello do
  import MyGuards

  def hello(name, age) when is_kid(age) do
    IO.puts("Hello Kid #{name}")
  end

  def hello(name, age) when is_adult(age) do
    IO.puts("Hello Mister #{name}")
  end

  def hello(name, age) do
    IO.puts("Hello Youth #{name}")
  end
end

defmodule Number.Guards do
  defguard is_three_or_five(number) when number === 3 or number === 5
end

defmodule Hello do
  import Number.Guards

  def check_favorite_number(num) when is_three_or_five(num) do
    IO.puts("The given #{num} is on of my favourite numbers")
  end

  def check_favorite_number(_num), do: IO.puts("Not my favorite number")
end
