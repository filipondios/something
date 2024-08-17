import Data.Char (toUpper)

toJadenCase' :: String -> Char -> String
toJadenCase' [] _ = []
toJadenCase' (x:xs) c = 
  case c of 
    ' ' -> toUpper x : toJadenCase' xs x
    _ -> x : toJadenCase' xs x

toJadenCase :: String -> String
toJadenCase js = toJadenCase' js ' '
