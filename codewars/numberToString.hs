import Data.Char(intToDigit)

numberToString' :: Int -> Int -> String
numberToString' num exp 
  | num < exp = [intToDigit result]
  | otherwise = numberToString' num (exp*10)  ++  [intToDigit result]
  where
    reminder = mod num exp
    result = reminder `div` (exp `div` 10)

-- main function
-- Convert Int to String
numberToString :: Int -> String
numberToString num 
  | num >= 0 = numberToString' num 10
  | num < 0 = '-' : numberToString' (abs num) 10
