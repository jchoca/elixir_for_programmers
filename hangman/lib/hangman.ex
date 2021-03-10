defmodule Hangman do
  def new_game(client) do
    {:ok, pid} = DynamicSupervisor.start_child(Hangman.Supervisor, {Hangman.Server, fn -> %{} end})
    Hangman.GameTracker.add_client(client)
    pid
  end

  def tally(game_pid) do
    GenServer.call(game_pid, { :tally })
  end

  def make_move(game_pid, guess) do
    GenServer.call(game_pid, { :make_move, guess })
  end
end
