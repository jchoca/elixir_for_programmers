defmodule Dictionary do
  defdelegate start_link(), to: Dictionary.WordList
  defdelegate random_word(words), to: Dictionary.WordList
end
