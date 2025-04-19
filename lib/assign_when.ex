defmodule AssignWhen do
  @moduledoc """
  Allows the use of 'when' clauses on assignment statements as an alternative to using 'if',
  avoiding the need for boilerplate 'else' clauses which return the original variables when
  the condition is 'false'. Eg:

  `x = 1 when x == nil`

  can replace

  `x = if x == nil, do: 1, else: x`

  """

  # Note this code is from José Valim from a private conversation I had with him.
  @doc """
  Allow `when` clauses on assignment statements as an alternative to `if` clauses.
  """
  defmacro unquote(:when)({:=, _, [left, right]}, condition) when true do
    quote do
      unquote(left) = if unquote(condition), do: unquote(right), else: unquote(left)
    end
  end
end
