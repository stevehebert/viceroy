defmodule ViceroyTest do
  use ExUnit.Case
  doctest Viceroy

  test "greets the world" do
    assert Viceroy.hello() == :world
  end

  test "triangle left test" do
    assert TriangleMembership.resolve({0, 5, 10}, 2.5) == 0.5
  end

  test "triangle right test" do
    assert TriangleMembership.resolve({0, 5, 10}, 6) == 0.8
  end

  test "triangle mid test" do
    assert TriangleMembership.resolve({0, 5, 10}, 5) == 1.0
  end

  test "triangle lower bound test" do
    assert TriangleMembership.resolve({3, 5, 10}, 1) == 0
  end

  test "triangle upper bound test" do
    assert TriangleMembership.resolve({3, 5, 10}, 20) == 0
  end
end
