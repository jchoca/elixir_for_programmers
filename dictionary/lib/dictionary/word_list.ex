defmodule Dictionary.WordList do
  defp word_list() do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end

  def random_word(words) do
    words
    |> Enum.random()
  end

  def start() do
    word_list()
  end
end
