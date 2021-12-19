defmodule LispEvalTest do
  use ExUnit.Case
  doctest LispEval

  test "greets the world" do
    assert LispEval.hello() == :world
  end
end
