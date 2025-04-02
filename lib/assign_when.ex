defmodule AssignWhen do
  @moduledoc """
  Allows one to replace code like this:

  x = if condition(), do: whatever, else: x

  with code like this:

  x = whatever when condition()

  Exports no functions, just a macro. The macro does no validation,
  but it does work on tuples and anything else that can be expressed
  as THING = THING
  """
  # Note this code is from Jose Valim from a private conversation I had with him.
  defmacro unquote(:when)({:=, _, [left, right]}, condition) when true do
    quote do
      unquote(left) = if unquote(condition), do: unquote(right), else: unquote(left)
    end
  end
end
