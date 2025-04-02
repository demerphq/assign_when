# AssignWhen

Allows one to replace code like this:

```elixir
x = if condition(), do: whatever, else: x
```

with code like this:

```elixir
x = whatever when condition()
```

Exports no functions, just a macro. The macro does no validation,
but it does work on tuples and anything else that can be expressed
as THING = THING

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `assign_when` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:assign_when, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/assign_when>.

