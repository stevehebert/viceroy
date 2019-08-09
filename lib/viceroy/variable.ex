defmodule Variable do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, [])
  end

  def init(state) do
    {:ok, state}
  end

  def add_membership(variable, adjective, membership) do
    GenServer.call(variable, {:add_membership, adjective, membership})
  end

  def get_membership(variable, adjective) when is_atom(adjective) do
    GenServer.call(variable, {:get_membership, adjective})
  end

  def handle_call({:add_membership, adjective, membership}, _from, state) do
    {:reply, :ok, Map.put(state, adjective, membership)}
  end

  def handle_call({:get_membership, adjective}, _from, state) do
    {:reply, Map.get(state, adjective, :error), state}
  end
end
