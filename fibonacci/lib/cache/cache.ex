defmodule Cache do
  def start(initial_state \\ %{}) do
    {:ok, agent} = Agent.start_link(fn -> initial_state end)
    agent
  end

  def set(agent, key, value) do
    Agent.update(agent, fn state -> Map.put(state, key, value) end)
    agent
  end

  def get(agent, key) do
    value = Agent.get(agent, fn state -> Map.get(state, key) end)
    {get_result_atom(value), value}
  end

  defp get_result_atom(nil) do
    :miss
  end

  defp get_result_atom(_) do
    :hit
  end
end
