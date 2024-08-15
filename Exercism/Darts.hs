
score :: Float -> Float -> Int
score x y 
  | x_y_pit <= 1 = 10 
  | x_y_pit <= 25 = 5
  | x_y_pit <= 100 = 1 
  | otherwise = 0
  where 
    x_y_pit = x*x + y*y
