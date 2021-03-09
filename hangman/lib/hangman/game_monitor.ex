defmodule Hangman.GameMonitor do
  use Task, restart: :permanent

  def start_link(_) do
    Task.start_link(__MODULE__, :run, [])
  end

  def run() do
    Process.sleep(1000)
  end
end
