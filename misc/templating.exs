defmodule Templating do
  def grocery_list() do
    shopping = [
      { "1 dozen", "eggs" },
      { "1 ripe", "melon" },
      { "4", "apples" },
      { "2 boxes", "tea" },
    ]

    template = """
      quantity | item
      --------------------\
      <%= for {qty, item} <- shopping do %>
        <%= String.pad_leading(qty, 10) %> | <%= item %>
      <% end %>
    """

    EEx.eval_string(template, [ shopping: shopping ], trim: true) |> IO.puts()
  end
end
