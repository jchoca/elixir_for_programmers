defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    children = [
      {DynamicSupervisor, name: Hangman.Supervisor, strategy: :one_for_one},
      {Hangman.GameTracker, name: Hangman.GameTracker, strategy: :one_for_one},
      {Hangman.GameMonitor, name: Hangman.GameMonitor, strategy: :one_for_one}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
