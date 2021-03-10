defmodule Hangman.NodeMonitor do
  use Task, restart: :permanent

  def start_link(_) do
    Task.start_link(__MODULE__, :run, [])
  end

  def run() do
    # Hangman.GameTracker.update_client_list(Node.list())
    # Process.sleep(1000)
    # IO.inspect(Hangman.GameTracker.get_client_list())
    :net_kernel.monitor_nodes(true)

    receive do
      {:nodeup, client} ->
        Hangman.GameTracker.add_client(client)
      {:nodedown, client} ->
        Hangman.GameTracker.remove_client(client)
    end

    run()
  end
end
