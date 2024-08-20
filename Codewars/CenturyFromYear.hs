
century :: Int -> Int
century year 
  | rem == 0 = result
  | otherwise = result + 1
  where (result,rem) = divMod year 100
