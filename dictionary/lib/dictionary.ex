defmodule Dictionary do
  defdelegate start(), to: Dictionary.WordList
  defdelegate random_word(words), to: Dictionary.WordList
end
