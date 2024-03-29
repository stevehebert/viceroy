defmodule ViceroyTest do
  use ExUnit.Case
  doctest Viceroy

  test "greets the world" do
    assert Viceroy.hello() == :world
  end

  test "triangular left test" do
    assert TriangularMembership.resolve({0, 5, 10}, 2.5) == 0.5
  end

  test "triangular right test" do
    assert TriangularMembership.resolve({0, 5, 10}, 6) == 0.8
  end

  test "triangular mid test" do
    assert TriangularMembership.resolve({0, 5, 10}, 5) == 1.0
  end

  test "triangular lower bound test" do
    assert TriangularMembership.resolve({3, 5, 10}, 1) == 0
  end

  test "triangular upper bound test" do
    assert TriangularMembership.resolve({3, 5, 10}, 20) == 0
  end

  test "trapezoidal low-left test" do
    assert TrapezoidalMembership.resolve({0, 5, 10, 20}, 2.5) == 0.5
  end

  test "trapezoidal right-high test" do
    assert TrapezoidalMembership.resolve({0, 5, 10, 20}, 12) == 0.8
  end

  test "trapezoidal right point test" do
    assert TrapezoidalMembership.resolve({0, 5, 10, 20}, 10) == 1.0
  end

  test "trapezoidal left point test" do
    assert TrapezoidalMembership.resolve({0, 5, 10, 20}, 5) == 1.0
  end

  test "trapezoidal mid test" do
    assert TrapezoidalMembership.resolve({0, 5, 10, 20}, 7) == 1.0
  end

  test "trapezoidal lower bound test" do
    assert TrapezoidalMembership.resolve({3, 5, 10, 20}, 1) == 0
  end

  test "trapezoidal upper bound test" do
    assert TrapezoidalMembership.resolve({3, 5, 10, 20}, 30) == 0
  end

  test "variable creation" do
    {:ok, temperature} = Variable.start_link(nil)

    Variable.add_membership(temperature, :cold, TriangularMembership.create({-100, 0.0, 50}))
    Variable.add_membership(temperature, :cool, TriangularMembership.create({40, 60, 80}))
    Variable.add_membership(temperature, :warm, TriangularMembership.create({75, 85, 95}))
    Variable.add_membership(temperature, :hot, TriangularMembership.create({90, 110, 120}))

    test = Variable.get_membership(temperature, :warm).mid

    assert test == 85
  end
end
