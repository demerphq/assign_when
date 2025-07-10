defmodule AssignWhenTest do
  use ExUnit.Case

  import AssignWhen

  doctest AssignWhen

  describe "when/2" do
    test "simple cases" do
      x = 1
      x = x * 2 when true

      assert x == 2

      x = x * 2 when false

      assert x == 2

      x = x * 2 when rem(x, 2) == 0

      assert x == 4

      x = x * 2 when rem(x, 2) == 1

      assert x == 4
    end

    test "multi-assignment with tuple" do
      x = 1
      y = 2
      {x, y} = {y, x} when true

      assert {x, y} == {2, 1}

      {x, y} = {x * 2 + 1, y * 2 + 1} when rem(y, 2) == 1

      assert {x, y} == {5, 3}

      {x, y} = {x * 2 + 1, y * 2 + 1} when rem(x, 2) == 0

      assert {x, y} == {5, 3}

      {x, y} = {x * 2, y * 2} when rem(y, 2) == 1

      assert {x, y} == {10, 6}
    end
  end

  describe "set/1" do
    test "simple cases" do
      x = 1
      set x = x * 2 when true

      assert x == 2

      set x = x * 2 when false

      assert x == 2

      set x = x * 2 when rem(x, 2) == 0

      assert x == 4

      set x = x * 2 when rem(x, 2) == 1

      assert x == 4
    end

    test "multi-assignment with tuple" do
      x = 1
      y = 2
      set {x, y} = {y, x} when true

      assert {x, y} == {2, 1}

      set {x, y} = {x * 2 + 1, y * 2 + 1} when rem(y, 2) == 1

      assert {x, y} == {5, 3}

      set {x, y} = {x * 2 + 1, y * 2 + 1} when rem(x, 2) == 0

      assert {x, y} == {5, 3}

      set {x, y} = {x * 2, y * 2} when rem(y, 2) == 1

      assert {x, y} == {10, 6}
    end
  end
end
