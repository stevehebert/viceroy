defmodule TrapezoidalMembership do
  use Membership

  defp calc_shape({low, left, _right, _high}, value) when value > low and value < left do
    (value - low) * (1.0 / (left - low))
  end

  defp calc_shape({_low, _left, right, high}, value) when value > right and value < high do
    1.0 - (value - right) * (1.0 / (high - right))
  end

  defp calc_shape({_low, left, right, _high}, value) when value >= left and value <= right do
    1.0
  end

  defp calc_shape(_shape, _value) do
    0.0
  end

  @spec resolve({float, float, float, float}, float) :: float
  def resolve(shape, value) do
    calc_shape(shape, value)
  end
end
