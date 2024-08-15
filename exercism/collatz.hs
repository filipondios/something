
collatz' :: Integer -> Integer -> Integer
collatz' 1 iter = iter
collatz' n iter 
  | even n = collatz' (div n 2) (iter+1)
  | otherwise = collatz' ((n * 3) + 1) (iter + 1)

collatz :: Integer -> Maybe Integer
collatz n 
  | n <= 0 = Nothing
  | otherwise = Just (collatz' n 0)
