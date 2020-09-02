for a <- 1..100, b <- 1..100, c = trunc(:math.sqrt(a*a + b*b)), a*a + b*b == c*c, c <= 100,
  do: {a, b, c}
|> IO.inspect()
