defmodule AssignWhen do
  @moduledoc """
  Enables conditional assignment using 'when' clauses, eliminating boilerplate 'if/else' statements.

  `x = 1 when y == nil`

  or

  `set x = 1 when y == nil`

  replaces:

  `x = if y == nil, do: 1, else: x`

  All you need to do is to add `import AssignWhen` to your module.

  Two variants are provided (with or without `set/1`).
  When using `set/1`, add this to your `.formatter.exs` to prevent formatter from adding parentheses:

  ```elixir
  import_deps: [:assign_when] # or add to existing `import_deps` list
  ```

  The direct `when` variant is shorter and familiar to users of other languages. While some may see it
  as a natural extension of Elixir's `when` operator, others might consider it operator overloading
  (which Elixir docs discourage). The line between extension and overloading is subtle here.

  The `set/1` variant offers a more conventional approach with better discoverability through LSP.
  """

  # Note this code is from José Valim from a private conversation I had with him.
  @doc """
  Allow `when` clauses on assignment statements as an alternative to `if` clauses.

  ## Examples

      iex> x = 1
      iex> x = x * 2 when true
      2
      iex> x
      2

      iex> x = 1
      iex> x = x * 3 when false
      1
      iex> x
      1
  """
  defmacro unquote(:when)({:=, _, [left, right]}, condition) when true do
    quote do
      unquote(left) = if unquote(condition), do: unquote(right), else: unquote(left)
    end
  end

  @doc """
  Allows to do conditional assignment.

  ## Examples

      iex> x = 1
      iex> set x = x * 2 when true
      2
      iex> x
      2

      iex> x = 1
      iex> set x = x * 3 when false
      1
      iex> x
      1
  """
  defmacro set(assign_when)

  defmacro set({:when, _, [{:=, _, [left, right]}, condition]}) do
    quote do
      unquote(left) =
        if unquote(condition) do
          unquote(right)
        else
          unquote(left)
        end
    end
  end

  defmacro set(_), do: raise("Invalid syntax for `set/1` macro. Expected syntax like: `set x = y when condition`.")
end
