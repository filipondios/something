import Data.Maybe (fromMaybe)

-- How many grains are in the 'n'th square
square :: Integer -> Maybe Integer
square n 
  | (n <= 0) || (n > 64) = Nothing
  | otherwise = Just (2 ^ (n-1))

-- Total of grains in a chessboard
total :: Integer
total = sum [ fromMaybe 0 e | n <- [1..64], let e = square n ]
