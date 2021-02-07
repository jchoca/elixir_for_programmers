defmodule Fibonacci do
  def fib(n) do
    cache = Cache.start(%{0 => 0, 1 => 1})
    fib(n, cache)
  end

  defp fib(n, cache) do
    value = Cache.get(cache, n)
    fib(n, cache, value)
  end

  defp fib(n, cache, nil) do
    result = fib(n-1, cache) + fib(n-2, cache)
    Cache.set(cache, n, result)
    result
  end

  defp fib(_n, _cache, result) do
    result
  end
end
