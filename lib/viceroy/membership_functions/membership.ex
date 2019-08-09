defmodule Membership do
  # this is the required callback for any membership to resolve.  The
  # first parameter tends to be a tuple associated with the shape of the
  # membership.
  @callback resolve(any, float) :: float

  defmacro __using__(_) do
    quote location: :keep do
      @behaviour Membership
    end
  end
end
