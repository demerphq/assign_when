# AssignWhen

Allows one to replace code like this:

```elixir
x = if condition(), do: whatever, else: x
```

with code like this:

```elixir
x = whatever when condition()
```

For instance you can write

```elixir
x = 1 when x == nil
```

Exports no functions, just a macro. The macro does no validation,
but it does work on tuples and anything else that can be expressed
as THING = THING

## Installation

The package can be installed by adding `assign_when` to your list of dependencies
in `mix.exs`:

```elixir
def deps do
  [
    {:assign_when, "~> 0.1.0"}
  ]
end
```

The documentation for this package can be found at <https://hexdocs.pm/assign_when>.
