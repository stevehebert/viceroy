defmodule TriangleMembership do
  defp calc_shape({left, mid, _right}, value) when value > left and value < mid do
    (value - left) * (1.0 / (mid - left))
  end

  defp calc_shape({_left, mid, right}, value) when value >= mid and value < right do
    1.0 - (value - mid) * (1.0 / (right - mid))
  end

  defp calc_shape(_shape, _value) do
    0
  end

  @spec resolve(any, any) :: float
  def resolve(shape, value) do
    calc_shape(shape, value)
  end
end
