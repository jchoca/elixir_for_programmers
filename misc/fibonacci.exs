defmodule Fibonacci do
  def fib(n) do
    cache = Cache.start(%{0 => 0, 1 => 1})
    {_, result} = fib(n, cache)
    result
  end

  defp fib(n, cache) do
    IO.inspect n
    IO.inspect cache
    result = Cache.get(cache, n)

    if result == nil do
      {cache, res1} = fib(n-1, cache)
      {cache, res2} = fib(n-2, cache)
      result = res1 + res2
      IO.inspect(result)
      cache = Cache.set(cache, n, result)
    end

    {cache, result}
  end
end
