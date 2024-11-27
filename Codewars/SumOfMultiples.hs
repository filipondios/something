{-              m/n                                     m/n
 - sumMul(n,m) = Σ  i*n = 1*n + 2*n + ... + m/n *n = n * Σ i.
 -              i=1                                     i=1
 -                        x
 - By Gauss, we know that Σ (i) (i being a Natural number), is equal 
 -                       i=1
 -
 - to the expression (x(x + 1))/2. So sumMul(n,m) = n * (m/n(m/n + 1))/2.
 - So then, we avoid creating and iterating over a list of m/n elements 
 - (maybe m/n - 1 if we consider not including 'm' as multiple as the 
 - description of the problem tells) such as x * sum [1..m/n].
 - 
 - Insted we just do a few operations O(1) instead of the previously
 - mentioned solution O(m/n).
 -}

sumMul :: Int -> Int -> Maybe Int
sumMul n m
  | m <= 1 || n >= m = Nothing
  | otherwise = Just $ n * ((limit * (limit + 1)) `div` 2)
    where
      limit = if (m `mod` n) == 0 then
        (m `div` n) - 1
        else m `div` n
