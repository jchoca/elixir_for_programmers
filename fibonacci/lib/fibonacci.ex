defmodule Fibonacci do
  def fib(n) do
    cache = Cache.start(%{0 => 0, 1 => 1})
    {_, result} = fib(n, cache)
    result
  end

  defp fib(n, cache) do
    {result, value} = Cache.get(cache, n)
    fib(n, cache, result, value)
  end

  defp fib(n, cache, :miss, _) do
    {cache, res1} = fib(n-1, cache)
    {cache, res2} = fib(n-2, cache)

    result = res1 + res2
    cache = Cache.set(cache, n, result)

    {cache, result}
  end

  defp fib(_n, cache, :hit, result) do
    {cache, result}
  end
end
