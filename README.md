# AssignWhen

Enables conditional assignment using 'when' clauses, eliminating boilerplate 'if/else' statements.

Two syntax variants are provided:

**Direct `when` syntax:**

```elixir
x = 1 when y == nil
```

**Alternative `set/1` syntax:**

```elixir
set x = 1 when y == nil
```

Both replace the equivalent:

```elixir
x = if y == nil, do: 1, else: x
```

All you need to do is add `import AssignWhen` to your module.

The direct `when` variant is shorter and familiar to users of other languages. The `set/1` variant offers a more conventional approach with better discoverability through LSP.

When using `set/1`, add this to your `.formatter.exs` to prevent formatter from adding parentheses:

```elixir
import_deps: [:assign_when] # or add to existing `import_deps` list
```

The macro works on tuples and anything else that can be expressed as `THING = THING`.

Macro code for direct `when` syntax originally suggested by José Valim

## Installation

The package can be installed by adding `assign_when` to your list of dependencies
in `mix.exs`:

```elixir
def deps do
  [
    {:assign_when, "~> 0.2.0"}
  ]
end
```

The documentation for this package can be found at <https://hexdocs.pm/assign_when>.
