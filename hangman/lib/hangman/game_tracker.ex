defmodule Hangman.GameTracker do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> %{ count: 0, clients: [] } end, name: __MODULE__)
  end

  # def update_client_list(client_list) do
  #   Agent.update(__MODULE__, fn _ -> %{
  #     count: Enum.count(client_list),
  #     clients: client_list
  #   } end)
  # end

  def add_client(client) do
    IO.puts("Client added: #{client}")

    Agent.update(__MODULE__, fn state -> %{
      count: state.count + 1,
      clients: [client | state.clients]}
    end)

    IO.puts("Clients:")
    IO.inspect(get_client_list())
  end

  def remove_client(client) do
    Agent.update(__MODULE__, fn state -> %{
      count: state.count - 1,
      clients: Enum.filter(state.clients, fn x -> x != client end)}
    end)
  end

  def get_client_list() do
    Agent.get(__MODULE__, fn state -> state.clients end)
  end
end
