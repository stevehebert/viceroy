defmodule ViceroyTest do
  use ExUnit.Case
  doctest Viceroy

  test "greets the world" do
    assert Viceroy.hello() == :world
  end
end
